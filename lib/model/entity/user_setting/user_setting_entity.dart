import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fukuda_fuzai/model/entity/device_info/device_info_entity.dart';

part 'user_setting_entity.freezed.dart';
part 'user_setting_entity.g.dart';

@freezed
class UserSettingEntity with _$UserSettingEntity {
    const UserSettingEntity._();

  const factory UserSettingEntity({
    required String name,
  }) = _UserSettingEntity;

   factory UserSettingEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSettingEntityFromJson(json);

}
