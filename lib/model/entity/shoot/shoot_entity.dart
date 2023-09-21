import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fukuda_fuzai/model/entity/sensor_per_info/sensor_per_info_entity.dart';

part 'shoot_entity.freezed.dart';
part 'shoot_entity.g.dart';

@freezed
class ShootEntity with _$ShootEntity {
    const ShootEntity._();

  const factory ShootEntity({
    required int id,
    required double charge,
    required SensorPerInfoEntity sensorPerInfo,
  }) = _ShootEntity;

   factory ShootEntity.fromJson(Map<String, dynamic> json) =>
      _$ShootEntityFromJson(json);

}
