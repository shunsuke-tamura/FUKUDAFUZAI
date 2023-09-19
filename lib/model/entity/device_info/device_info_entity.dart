import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fukuda_fuzai/model/document/acc/acc_document.dart';
import 'package:fukuda_fuzai/model/document/gyr/gyr_document.dart';

part 'device_info_entity.freezed.dart';
part 'device_info_entity.g.dart';


@freezed
class DeviceInfoEntity with _$DeviceInfoEntity {
    const DeviceInfoEntity._();

  const factory DeviceInfoEntity({
    required AccDocument acc,
    required GyrDocument gyro,
  }) = _DeviceInfoEntity;

   factory DeviceInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoEntityFromJson(json);

}
