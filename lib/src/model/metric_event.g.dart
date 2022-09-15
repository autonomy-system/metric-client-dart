// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetricEventAdapter extends TypeAdapter<MetricEvent> {
  @override
  final int typeId = 1;

  @override
  MetricEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetricEvent(
      name: fields[0] as String,
      message: fields[1] as String?,
      data: (fields[2] as Map).cast<String, dynamic>(),
      hashedData: (fields[3] as Map).cast<String, dynamic>(),
      timestamp: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MetricEvent obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.hashedData)
      ..writeByte(4)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetricEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricEvent _$MetricEventFromJson(Map<String, dynamic> json) => MetricEvent(
      name: json['name'] as String,
      message: json['message'] as String?,
      data: json['data'] as Map<String, dynamic>,
      hashedData: json['hashedData'] as Map<String, dynamic>,
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$MetricEventToJson(MetricEvent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'data': instance.data,
      'hashedData': instance.hashedData,
      'timestamp': instance.timestamp,
    };
