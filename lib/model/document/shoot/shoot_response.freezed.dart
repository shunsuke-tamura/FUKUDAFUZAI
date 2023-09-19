// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoot_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShootResponse _$ShootResponseFromJson(Map<String, dynamic> json) {
  return _ShootResponse.fromJson(json);
}

/// @nodoc
mixin _$ShootResponse {
  @JsonKey(name: 'score')
  int? get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShootResponseCopyWith<ShootResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShootResponseCopyWith<$Res> {
  factory $ShootResponseCopyWith(
          ShootResponse value, $Res Function(ShootResponse) then) =
      _$ShootResponseCopyWithImpl<$Res, ShootResponse>;
  @useResult
  $Res call({@JsonKey(name: 'score') int? score});
}

/// @nodoc
class _$ShootResponseCopyWithImpl<$Res, $Val extends ShootResponse>
    implements $ShootResponseCopyWith<$Res> {
  _$ShootResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShootResponseCopyWith<$Res>
    implements $ShootResponseCopyWith<$Res> {
  factory _$$_ShootResponseCopyWith(
          _$_ShootResponse value, $Res Function(_$_ShootResponse) then) =
      __$$_ShootResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'score') int? score});
}

/// @nodoc
class __$$_ShootResponseCopyWithImpl<$Res>
    extends _$ShootResponseCopyWithImpl<$Res, _$_ShootResponse>
    implements _$$_ShootResponseCopyWith<$Res> {
  __$$_ShootResponseCopyWithImpl(
      _$_ShootResponse _value, $Res Function(_$_ShootResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
  }) {
    return _then(_$_ShootResponse(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShootResponse extends _ShootResponse {
  const _$_ShootResponse({@JsonKey(name: 'score') this.score}) : super._();

  factory _$_ShootResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ShootResponseFromJson(json);

  @override
  @JsonKey(name: 'score')
  final int? score;

  @override
  String toString() {
    return 'ShootResponse(score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShootResponse &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShootResponseCopyWith<_$_ShootResponse> get copyWith =>
      __$$_ShootResponseCopyWithImpl<_$_ShootResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShootResponseToJson(
      this,
    );
  }
}

abstract class _ShootResponse extends ShootResponse {
  const factory _ShootResponse({@JsonKey(name: 'score') final int? score}) =
      _$_ShootResponse;
  const _ShootResponse._() : super._();

  factory _ShootResponse.fromJson(Map<String, dynamic> json) =
      _$_ShootResponse.fromJson;

  @override
  @JsonKey(name: 'score')
  int? get score;
  @override
  @JsonKey(ignore: true)
  _$$_ShootResponseCopyWith<_$_ShootResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
