import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_dto.freezed.dart';
part 'news_dto.g.dart';

@freezed
abstract class NewsDto with _$NewsDto {
  factory NewsDto({
    required String id,
    required String title,
    required String content,
    required String authorName,
    required DateTime createdAt,
    @Default(false) bool isRtl,
    String? imageUrl,
  }) = _NewsDto;

  factory NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);
}