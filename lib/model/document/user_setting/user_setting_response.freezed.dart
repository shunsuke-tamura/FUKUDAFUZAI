// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_setting_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettingResponse _$UserSettingResponseFromJson(Map<String, dynamic> json) {
  return _UserSettingResponse.fromJson(json);
}

/// @nodoc
mixin _$UserSettingResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'colorCode')
  String get colorCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingResponseCopyWith<UserSettingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingResponseCopyWith<$Res> {
  factory $UserSettingResponseCopyWith(
          UserSettingResponse value, $Res Function(UserSettingResponse) then) =
      _$UserSettingResponseCopyWithImpl<$Res, UserSettingResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'colorCode') String colorCode});
}

/// @nodoc
class _$UserSettingResponseCopyWithImpl<$Res, $Val extends UserSettingResponse>
    implements $UserSettingResponseCopyWith<$Res> {
  _$UserSettingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSettingResponseCopyWith<$Res>
    implements $UserSettingResponseCopyWith<$Res> {
  factory _$$_UserSettingResponseCopyWith(_$_UserSettingResponse value,
          $Res Function(_$_UserSettingResponse) then) =
      __$$_UserSettingResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'colorCode') String colorCode});
}

/// @nodoc
class __$$_UserSettingResponseCopyWithImpl<$Res>
    extends _$UserSettingResponseCopyWithImpl<$Res, _$_UserSettingResponse>
    implements _$$_UserSettingResponseCopyWith<$Res> {
  __$$_UserSettingResponseCopyWithImpl(_$_UserSettingResponse _value,
      $Res Function(_$_UserSettingResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorCode = null,
  }) {
    return _then(_$_UserSettingResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSettingResponse extends _UserSettingResponse {
  const _$_UserSettingResponse(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'colorCode') required this.colorCode})
      : super._();

  factory _$_UserSettingResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserSettingResponseFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'colorCode')
  final String colorCode;

  @override
  String toString() {
    return 'UserSettingResponse(id: $id, name: $name, colorCode: $colorCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSettingResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSettingResponseCopyWith<_$_UserSettingResponse> get copyWith =>
      __$$_UserSettingResponseCopyWithImpl<_$_UserSettingResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSettingResponseToJson(
      this,
    );
  }
}

abstract class _UserSettingResponse extends UserSettingResponse {
  const factory _UserSettingResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'colorCode') required final String colorCode}) =
      _$_UserSettingResponse;
  const _UserSettingResponse._() : super._();

  factory _UserSettingResponse.fromJson(Map<String, dynamic> json) =
      _$_UserSettingResponse.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'colorCode')
  String get colorCode;
  @override
  @JsonKey(ignore: true)
  _$$_UserSettingResponseCopyWith<_$_UserSettingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
