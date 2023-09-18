import 'package:freezed_annotation/freezed_annotation.dart';

part 'acc_document.freezed.dart';

part 'acc_document.g.dart';

@freezed
class AccDocument with _$AccDocument {
  const AccDocument._();

  const factory AccDocument({
    @JsonKey(name: 'x') required double x,
    @JsonKey(name: 'y') required double y,
    @JsonKey(name: 'z') required double z,
  }) = _AccDocument;

  factory AccDocument.fromJson(Map<String, dynamic> json) =>
      _$AccDocumentFromJson(json);
}
