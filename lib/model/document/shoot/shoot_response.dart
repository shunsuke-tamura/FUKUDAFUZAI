import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoot_response.freezed.dart';

part 'shoot_response.g.dart';

@freezed
class ShootResponse with _$ShootResponse {
  const ShootResponse._();

  const factory ShootResponse({
    @JsonKey(name: 'score') int? score,
  }) = _ShootResponse;

  factory ShootResponse.fromJson(Map<String, dynamic> json) =>
      _$ShootResponseFromJson(json);
}
