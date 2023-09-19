import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';
part 'message_entity.g.dart';


@freezed
class MessageEntity with _$MessageEntity {
    const MessageEntity._();

  const factory MessageEntity({
    required String? type,
    required dynamic data,
  }) = _MessageEntity;

   factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);

}
