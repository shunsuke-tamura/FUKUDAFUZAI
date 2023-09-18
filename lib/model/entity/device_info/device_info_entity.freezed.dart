// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceInfoEntity _$DeviceInfoEntityFromJson(Map<String, dynamic> json) {
  return _DeviceInfoEntity.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfoEntity {
  AccDocument get acc => throw _privateConstructorUsedError;
  GyrDocument get gyro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceInfoEntityCopyWith<DeviceInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoEntityCopyWith<$Res> {
  factory $DeviceInfoEntityCopyWith(
          DeviceInfoEntity value, $Res Function(DeviceInfoEntity) then) =
      _$DeviceInfoEntityCopyWithImpl<$Res, DeviceInfoEntity>;
  @useResult
  $Res call({AccDocument acc, GyrDocument gyro});

  $AccDocumentCopyWith<$Res> get acc;
  $GyrDocumentCopyWith<$Res> get gyro;
}

/// @nodoc
class _$DeviceInfoEntityCopyWithImpl<$Res, $Val extends DeviceInfoEntity>
    implements $DeviceInfoEntityCopyWith<$Res> {
  _$DeviceInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acc = null,
    Object? gyro = null,
  }) {
    return _then(_value.copyWith(
      acc: null == acc
          ? _value.acc
          : acc // ignore: cast_nullable_to_non_nullable
              as AccDocument,
      gyro: null == gyro
          ? _value.gyro
          : gyro // ignore: cast_nullable_to_non_nullable
              as GyrDocument,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccDocumentCopyWith<$Res> get acc {
    return $AccDocumentCopyWith<$Res>(_value.acc, (value) {
      return _then(_value.copyWith(acc: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GyrDocumentCopyWith<$Res> get gyro {
    return $GyrDocumentCopyWith<$Res>(_value.gyro, (value) {
      return _then(_value.copyWith(gyro: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeviceInfoEntityCopyWith<$Res>
    implements $DeviceInfoEntityCopyWith<$Res> {
  factory _$$_DeviceInfoEntityCopyWith(
          _$_DeviceInfoEntity value, $Res Function(_$_DeviceInfoEntity) then) =
      __$$_DeviceInfoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AccDocument acc, GyrDocument gyro});

  @override
  $AccDocumentCopyWith<$Res> get acc;
  @override
  $GyrDocumentCopyWith<$Res> get gyro;
}

/// @nodoc
class __$$_DeviceInfoEntityCopyWithImpl<$Res>
    extends _$DeviceInfoEntityCopyWithImpl<$Res, _$_DeviceInfoEntity>
    implements _$$_DeviceInfoEntityCopyWith<$Res> {
  __$$_DeviceInfoEntityCopyWithImpl(
      _$_DeviceInfoEntity _value, $Res Function(_$_DeviceInfoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acc = null,
    Object? gyro = null,
  }) {
    return _then(_$_DeviceInfoEntity(
      acc: null == acc
          ? _value.acc
          : acc // ignore: cast_nullable_to_non_nullable
              as AccDocument,
      gyro: null == gyro
          ? _value.gyro
          : gyro // ignore: cast_nullable_to_non_nullable
              as GyrDocument,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceInfoEntity extends _DeviceInfoEntity {
  const _$_DeviceInfoEntity({required this.acc, required this.gyro})
      : super._();

  factory _$_DeviceInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceInfoEntityFromJson(json);

  @override
  final AccDocument acc;
  @override
  final GyrDocument gyro;

  @override
  String toString() {
    return 'DeviceInfoEntity(acc: $acc, gyro: $gyro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceInfoEntity &&
            (identical(other.acc, acc) || other.acc == acc) &&
            (identical(other.gyro, gyro) || other.gyro == gyro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, acc, gyro);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceInfoEntityCopyWith<_$_DeviceInfoEntity> get copyWith =>
      __$$_DeviceInfoEntityCopyWithImpl<_$_DeviceInfoEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceInfoEntityToJson(
      this,
    );
  }
}

abstract class _DeviceInfoEntity extends DeviceInfoEntity {
  const factory _DeviceInfoEntity(
      {required final AccDocument acc,
      required final GyrDocument gyro}) = _$_DeviceInfoEntity;
  const _DeviceInfoEntity._() : super._();

  factory _DeviceInfoEntity.fromJson(Map<String, dynamic> json) =
      _$_DeviceInfoEntity.fromJson;

  @override
  AccDocument get acc;
  @override
  GyrDocument get gyro;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceInfoEntityCopyWith<_$_DeviceInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
