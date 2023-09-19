// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoot_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShootEntity _$ShootEntityFromJson(Map<String, dynamic> json) {
  return _ShootEntity.fromJson(json);
}

/// @nodoc
mixin _$ShootEntity {
  String get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShootEntityCopyWith<ShootEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShootEntityCopyWith<$Res> {
  factory $ShootEntityCopyWith(
          ShootEntity value, $Res Function(ShootEntity) then) =
      _$ShootEntityCopyWithImpl<$Res, ShootEntity>;
  @useResult
  $Res call({String action});
}

/// @nodoc
class _$ShootEntityCopyWithImpl<$Res, $Val extends ShootEntity>
    implements $ShootEntityCopyWith<$Res> {
  _$ShootEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShootEntityCopyWith<$Res>
    implements $ShootEntityCopyWith<$Res> {
  factory _$$_ShootEntityCopyWith(
          _$_ShootEntity value, $Res Function(_$_ShootEntity) then) =
      __$$_ShootEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action});
}

/// @nodoc
class __$$_ShootEntityCopyWithImpl<$Res>
    extends _$ShootEntityCopyWithImpl<$Res, _$_ShootEntity>
    implements _$$_ShootEntityCopyWith<$Res> {
  __$$_ShootEntityCopyWithImpl(
      _$_ShootEntity _value, $Res Function(_$_ShootEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$_ShootEntity(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShootEntity extends _ShootEntity {
  const _$_ShootEntity({required this.action}) : super._();

  factory _$_ShootEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ShootEntityFromJson(json);

  @override
  final String action;

  @override
  String toString() {
    return 'ShootEntity(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShootEntity &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShootEntityCopyWith<_$_ShootEntity> get copyWith =>
      __$$_ShootEntityCopyWithImpl<_$_ShootEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShootEntityToJson(
      this,
    );
  }
}

abstract class _ShootEntity extends ShootEntity {
  const factory _ShootEntity({required final String action}) = _$_ShootEntity;
  const _ShootEntity._() : super._();

  factory _ShootEntity.fromJson(Map<String, dynamic> json) =
      _$_ShootEntity.fromJson;

  @override
  String get action;
  @override
  @JsonKey(ignore: true)
  _$$_ShootEntityCopyWith<_$_ShootEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
