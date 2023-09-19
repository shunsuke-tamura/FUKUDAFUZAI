// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettingEntity _$UserSettingEntityFromJson(Map<String, dynamic> json) {
  return _UserSettingEntity.fromJson(json);
}

/// @nodoc
mixin _$UserSettingEntity {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingEntityCopyWith<UserSettingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingEntityCopyWith<$Res> {
  factory $UserSettingEntityCopyWith(
          UserSettingEntity value, $Res Function(UserSettingEntity) then) =
      _$UserSettingEntityCopyWithImpl<$Res, UserSettingEntity>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$UserSettingEntityCopyWithImpl<$Res, $Val extends UserSettingEntity>
    implements $UserSettingEntityCopyWith<$Res> {
  _$UserSettingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSettingEntityCopyWith<$Res>
    implements $UserSettingEntityCopyWith<$Res> {
  factory _$$_UserSettingEntityCopyWith(_$_UserSettingEntity value,
          $Res Function(_$_UserSettingEntity) then) =
      __$$_UserSettingEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_UserSettingEntityCopyWithImpl<$Res>
    extends _$UserSettingEntityCopyWithImpl<$Res, _$_UserSettingEntity>
    implements _$$_UserSettingEntityCopyWith<$Res> {
  __$$_UserSettingEntityCopyWithImpl(
      _$_UserSettingEntity _value, $Res Function(_$_UserSettingEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_UserSettingEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSettingEntity extends _UserSettingEntity {
  const _$_UserSettingEntity({required this.name}) : super._();

  factory _$_UserSettingEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserSettingEntityFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'UserSettingEntity(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSettingEntity &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSettingEntityCopyWith<_$_UserSettingEntity> get copyWith =>
      __$$_UserSettingEntityCopyWithImpl<_$_UserSettingEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSettingEntityToJson(
      this,
    );
  }
}

abstract class _UserSettingEntity extends UserSettingEntity {
  const factory _UserSettingEntity({required final String name}) =
      _$_UserSettingEntity;
  const _UserSettingEntity._() : super._();

  factory _UserSettingEntity.fromJson(Map<String, dynamic> json) =
      _$_UserSettingEntity.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_UserSettingEntityCopyWith<_$_UserSettingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
