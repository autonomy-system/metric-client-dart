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
      data: (fields[1] as Map).cast<String, dynamic>(),
      hashedData: (fields[2] as Map).cast<String, dynamic>(),
      timestamp: fields[3] as int,
      device_id: fields[5] as String?,
      internal_build: fields[8] as bool?,
      user_id: fields[4] as String?,
      platform: fields[6] as String?,
      version: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MetricEvent obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.hashedData)
      ..writeByte(3)
      ..write(obj.timestamp)
      ..writeByte(4)
      ..write(obj.user_id)
      ..writeByte(5)
      ..write(obj.device_id)
      ..writeByte(6)
      ..write(obj.platform)
      ..writeByte(7)
      ..write(obj.version)
      ..writeByte(8)
      ..write(obj.internal_build);
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
      data: json['data'] as Map<String, dynamic>,
      hashedData: json['hashedData'] as Map<String, dynamic>,
      timestamp: json['timestamp'] as int,
      device_id: json['device_id'] as String?,
      internal_build: json['internal_build'] as bool?,
      user_id: json['user_id'] as String?,
      platform: json['platform'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$MetricEventToJson(MetricEvent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
      'hashedData': instance.hashedData,
      'timestamp': instance.timestamp,
      'user_id': instance.user_id,
      'device_id': instance.device_id,
      'platform': instance.platform,
      'version': instance.version,
      'internal_build': instance.internal_build,
    };
