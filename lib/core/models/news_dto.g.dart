// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) => _NewsDto(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      authorName: json['authorName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRtl: json['isRtl'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$NewsDtoToJson(_NewsDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'authorName': instance.authorName,
      'createdAt': instance.createdAt.toIso8601String(),
      'isRtl': instance.isRtl,
      'imageUrl': instance.imageUrl,
    };
