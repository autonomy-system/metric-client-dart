import 'package:logging/logging.dart';
import 'package:metric_client/src/model/device_config.dart';

class StorageOption {
  String name;
  String path;

  StorageOption({required this.name, required this.path});
}

class APIOption {
  String endpoint;
  String secret;

  APIOption({required this.endpoint, required this.secret});
}

abstract class MetricClientInterface {
  Future<void> init(
      {required StorageOption storageOption,
      required APIOption apiOption,
      Logger? logger});

  Future<void> addEvent(
    String name, {
    String? userId,
    String? message,
    Map<String, dynamic> data = const {},
    Map<String, dynamic> hashedData = const {},
    DeviceConfig? deviceConfig,
  });

  Future<void> sendMetrics();

  Future<void> clear();
}
