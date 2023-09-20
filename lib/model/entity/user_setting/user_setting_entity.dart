import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_setting_entity.freezed.dart';
part 'user_setting_entity.g.dart';

@freezed
class UserSettingEntity with _$UserSettingEntity {
    const UserSettingEntity._();

  const factory UserSettingEntity({
    required int id,
    required String name,
    required String colorCode,
  }) = _UserSettingEntity;

   factory UserSettingEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSettingEntityFromJson(json);

}
