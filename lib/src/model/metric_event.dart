import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metric_event.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class MetricEvent extends HiveObject {
  MetricEvent(
      {required this.name,
      required this.data,
      required this.hashedData,
      required this.timestamp});

  @HiveField(0)
  String name;

  @HiveField(1)
  Map<String, dynamic> data;

  @HiveField(2)
  Map<String, dynamic> hashedData;

  @HiveField(3)
  int timestamp;

  @override
  String toString() {
    return '$name: $name';
  }

  factory MetricEvent.fromJson(Map<String, dynamic> json) =>
      _$MetricEventFromJson(json);

  /// Connect the generated [_$MetricEventToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MetricEventToJson(this);
}
