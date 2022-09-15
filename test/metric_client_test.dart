import 'dart:io';

import 'package:logging/logging.dart';
import 'package:metric_client/metric_client.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() async {
      await MetricClient.init(
          storageOption:
              StorageOption(name: "metric", path: Directory.current.path),
          apiOption: APIOption(endpoint: "example.com", secret: ""),
          logger: Logger("metric_test"));
    });

    tearDown(() async {
      await MetricClient.clear();
    });

    test('Put metric', () async {
      await MetricClient.addEvent("name", message: "this is a test message");
    });
  });
}
