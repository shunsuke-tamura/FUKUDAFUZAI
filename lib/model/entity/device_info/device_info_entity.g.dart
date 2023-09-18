// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceInfoEntity _$$_DeviceInfoEntityFromJson(Map<String, dynamic> json) =>
    _$_DeviceInfoEntity(
      acc: AccDocument.fromJson(json['acc'] as Map<String, dynamic>),
      gyro: GyrDocument.fromJson(json['gyro'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeviceInfoEntityToJson(_$_DeviceInfoEntity instance) =>
    <String, dynamic>{
      'acc': instance.acc,
      'gyro': instance.gyro,
    };
