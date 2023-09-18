// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gyr_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GyrDocument _$GyrDocumentFromJson(Map<String, dynamic> json) {
  return _GyrDocument.fromJson(json);
}

/// @nodoc
mixin _$GyrDocument {
  @JsonKey(name: 'x')
  double get x => throw _privateConstructorUsedError;
  @JsonKey(name: 'y')
  double get y => throw _privateConstructorUsedError;
  @JsonKey(name: 'z')
  double get z => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GyrDocumentCopyWith<GyrDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GyrDocumentCopyWith<$Res> {
  factory $GyrDocumentCopyWith(
          GyrDocument value, $Res Function(GyrDocument) then) =
      _$GyrDocumentCopyWithImpl<$Res, GyrDocument>;
  @useResult
  $Res call(
      {@JsonKey(name: 'x') double x,
      @JsonKey(name: 'y') double y,
      @JsonKey(name: 'z') double z});
}

/// @nodoc
class _$GyrDocumentCopyWithImpl<$Res, $Val extends GyrDocument>
    implements $GyrDocumentCopyWith<$Res> {
  _$GyrDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? z = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GyrDocumentCopyWith<$Res>
    implements $GyrDocumentCopyWith<$Res> {
  factory _$$_GyrDocumentCopyWith(
          _$_GyrDocument value, $Res Function(_$_GyrDocument) then) =
      __$$_GyrDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'x') double x,
      @JsonKey(name: 'y') double y,
      @JsonKey(name: 'z') double z});
}

/// @nodoc
class __$$_GyrDocumentCopyWithImpl<$Res>
    extends _$GyrDocumentCopyWithImpl<$Res, _$_GyrDocument>
    implements _$$_GyrDocumentCopyWith<$Res> {
  __$$_GyrDocumentCopyWithImpl(
      _$_GyrDocument _value, $Res Function(_$_GyrDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? z = null,
  }) {
    return _then(_$_GyrDocument(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GyrDocument extends _GyrDocument {
  const _$_GyrDocument(
      {@JsonKey(name: 'x') required this.x,
      @JsonKey(name: 'y') required this.y,
      @JsonKey(name: 'z') required this.z})
      : super._();

  factory _$_GyrDocument.fromJson(Map<String, dynamic> json) =>
      _$$_GyrDocumentFromJson(json);

  @override
  @JsonKey(name: 'x')
  final double x;
  @override
  @JsonKey(name: 'y')
  final double y;
  @override
  @JsonKey(name: 'z')
  final double z;

  @override
  String toString() {
    return 'GyrDocument(x: $x, y: $y, z: $z)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GyrDocument &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.z, z) || other.z == z));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, z);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GyrDocumentCopyWith<_$_GyrDocument> get copyWith =>
      __$$_GyrDocumentCopyWithImpl<_$_GyrDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GyrDocumentToJson(
      this,
    );
  }
}

abstract class _GyrDocument extends GyrDocument {
  const factory _GyrDocument(
      {@JsonKey(name: 'x') required final double x,
      @JsonKey(name: 'y') required final double y,
      @JsonKey(name: 'z') required final double z}) = _$_GyrDocument;
  const _GyrDocument._() : super._();

  factory _GyrDocument.fromJson(Map<String, dynamic> json) =
      _$_GyrDocument.fromJson;

  @override
  @JsonKey(name: 'x')
  double get x;
  @override
  @JsonKey(name: 'y')
  double get y;
  @override
  @JsonKey(name: 'z')
  double get z;
  @override
  @JsonKey(ignore: true)
  _$$_GyrDocumentCopyWith<_$_GyrDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
