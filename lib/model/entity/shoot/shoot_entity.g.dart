// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoot_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShootEntity _$$_ShootEntityFromJson(Map<String, dynamic> json) =>
    _$_ShootEntity(
      id: json['id'] as int,
      sensorPerInfo: SensorPerInfoEntity.fromJson(
          json['sensorPerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ShootEntityToJson(_$_ShootEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sensorPerInfo': instance.sensorPerInfo,
    };
