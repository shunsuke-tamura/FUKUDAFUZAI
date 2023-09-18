import 'package:freezed_annotation/freezed_annotation.dart';

part 'gyr_document.freezed.dart';

part 'gyr_document.g.dart';

@freezed
class GyrDocument with _$GyrDocument {
  const GyrDocument._();

  const factory GyrDocument({
    @JsonKey(name: 'x') required double x,
    @JsonKey(name: 'y') required double y,
    @JsonKey(name: 'z') required double z,
  }) = _GyrDocument;

  factory GyrDocument.fromJson(Map<String, dynamic> json) =>
      _$GyrDocumentFromJson(json);
}
