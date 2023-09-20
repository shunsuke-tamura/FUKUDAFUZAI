import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_setting_response.freezed.dart';

part 'user_setting_response.g.dart';

@freezed
class UserSettingResponse with _$UserSettingResponse {
  const UserSettingResponse._();

  const factory UserSettingResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'colorCode') required String colorCode,
  }) = _UserSettingResponse;

  factory UserSettingResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSettingResponseFromJson(json);
}
