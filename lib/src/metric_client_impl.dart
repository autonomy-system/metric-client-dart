import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:metric_client/src/metric_client.dart';
import 'package:hive/hive.dart';
import 'package:metric_client/src/model/metric_event.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class MetricClientImpl implements MetricClientInterface {
  late Box<MetricEvent> hiveBox;
  late APIOption _apiOption;
  Logger? _logger;

  @override
  Future<void> init(
      {required StorageOption storageOption,
      required APIOption apiOption,
      Logger? logger}) async {
    _logger = logger;
    _apiOption = apiOption;

    final metricEventAdapter = MetricEventAdapter();
    if (!Hive.isAdapterRegistered(metricEventAdapter.typeId)) {
      Hive
        ..init(storageOption.path)
        ..registerAdapter(metricEventAdapter);
      hiveBox =
          await Hive.openBox(storageOption.name, path: storageOption.path);
    }
  }

  @override
  Future<void> addEvent(String name,
      {String? message,
      Map<String, dynamic> data = const {},
      Map<String, dynamic> hashedData = const {}}) async {
    if (hashedData.isNotEmpty) {
      hashedData = hashedData.map((key, value) =>
          MapEntry(key, sha224.convert(utf8.encode(value)).toString()));
    }
    final event = MetricEvent(
        name: name,
        data: data,
        hashedData: hashedData,
        timestamp: DateTime.now().millisecondsSinceEpoch);
    await hiveBox.add(event);
  }

  @override
  Future<void> sendMetrics() async {
    final events = hiveBox.toMap();
    if (events.isEmpty) return;
    final body = events.values.fold<List<String>>(
        List<String>.empty(growable: true), (value, element) {
      value.add(jsonEncode(element.toJson()));
      return value;
    }).join("\n");

    // url
    final url = _apiOption.endpoint;
    const path = "/metrics";
    final key = _apiOption.secret;
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final canonicalString =
        List<String>.of(["POST", path, body, timestamp]).join(",");

    final hmacSha256 = Hmac(sha256, utf8.encode(key)); // HMAC-SHA256
    final digest = hmacSha256.convert(utf8.encode(canonicalString));
    final sig = base64Encode(digest.bytes);

    var uri = Uri.https(url, path);
    var response = await http.post(uri, body: body, headers: {
      "timestamp": timestamp,
      "Authorization": "HMAC-SHA256 $sig",
    });
    _logger?.fine('Response status: ${response.statusCode}');
    if (response.statusCode >= 400) {
      _logger?.fine('Response body: ${response.body}');
      throw (response.body);
    }
  }

  @override
  Future<void> clear() {
    return hiveBox.clear();
  }
}
