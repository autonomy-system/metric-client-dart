/// Support for doing something awesome.
///
/// More dartdocs go here.
library metric_client;

import 'package:metric_client/src/metric_client.dart';
import 'package:metric_client/src/metric_client_impl.dart';

export 'src/metric_client.dart';

final MetricClientInterface MetricClient = MetricClientImpl();
