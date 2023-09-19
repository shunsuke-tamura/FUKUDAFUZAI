import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fukuda_fuzai/model/document/acc/acc_document.dart';
import 'package:fukuda_fuzai/model/document/gyr/gyr_document.dart';

part 'sensor_per_info_entity.freezed.dart';
part 'sensor_per_info_entity.g.dart';


@freezed
class SensorPerInfoEntity with _$SensorPerInfoEntity {
    const SensorPerInfoEntity._();

  const factory SensorPerInfoEntity({
    required AccDocument acc,
    required GyrDocument gyro,
  }) = _SensorPerInfoEntity;

   factory SensorPerInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$SensorPerInfoEntityFromJson(json);

}
