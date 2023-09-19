// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_per_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SensorPerInfoEntity _$$_SensorPerInfoEntityFromJson(
        Map<String, dynamic> json) =>
    _$_SensorPerInfoEntity(
      acc: AccDocument.fromJson(json['acc'] as Map<String, dynamic>),
      gyro: GyrDocument.fromJson(json['gyro'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SensorPerInfoEntityToJson(
        _$_SensorPerInfoEntity instance) =>
    <String, dynamic>{
      'acc': instance.acc,
      'gyro': instance.gyro,
    };
