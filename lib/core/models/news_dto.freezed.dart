// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsDto {
  String get id;
  String get title;
  String get content;
  String get authorName;
  DateTime get createdAt;
  bool get isRtl;
  String? get imageUrl;

  /// Create a copy of NewsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsDtoCopyWith<NewsDto> get copyWith =>
      _$NewsDtoCopyWithImpl<NewsDto>(this as NewsDto, _$identity);

  /// Serializes this NewsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRtl, isRtl) || other.isRtl == isRtl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, authorName, createdAt, isRtl, imageUrl);

  @override
  String toString() {
    return 'NewsDto(id: $id, title: $title, content: $content, authorName: $authorName, createdAt: $createdAt, isRtl: $isRtl, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $NewsDtoCopyWith<$Res> {
  factory $NewsDtoCopyWith(NewsDto value, $Res Function(NewsDto) _then) =
      _$NewsDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String authorName,
      DateTime createdAt,
      bool isRtl,
      String? imageUrl});
}

/// @nodoc
class _$NewsDtoCopyWithImpl<$Res> implements $NewsDtoCopyWith<$Res> {
  _$NewsDtoCopyWithImpl(this._self, this._then);

  final NewsDto _self;
  final $Res Function(NewsDto) _then;

  /// Create a copy of NewsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? authorName = null,
    Object? createdAt = null,
    Object? isRtl = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _self.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRtl: null == isRtl
          ? _self.isRtl
          : isRtl // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NewsDto implements NewsDto {
  _NewsDto(
      {required this.id,
      required this.title,
      required this.content,
      required this.authorName,
      required this.createdAt,
      this.isRtl = false,
      this.imageUrl});
  factory _NewsDto.fromJson(Map<String, dynamic> json) =>
      _$NewsDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String authorName;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isRtl;
  @override
  final String? imageUrl;

  /// Create a copy of NewsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsDtoCopyWith<_NewsDto> get copyWith =>
      __$NewsDtoCopyWithImpl<_NewsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NewsDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRtl, isRtl) || other.isRtl == isRtl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, authorName, createdAt, isRtl, imageUrl);

  @override
  String toString() {
    return 'NewsDto(id: $id, title: $title, content: $content, authorName: $authorName, createdAt: $createdAt, isRtl: $isRtl, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$NewsDtoCopyWith<$Res> implements $NewsDtoCopyWith<$Res> {
  factory _$NewsDtoCopyWith(_NewsDto value, $Res Function(_NewsDto) _then) =
      __$NewsDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String authorName,
      DateTime createdAt,
      bool isRtl,
      String? imageUrl});
}

/// @nodoc
class __$NewsDtoCopyWithImpl<$Res> implements _$NewsDtoCopyWith<$Res> {
  __$NewsDtoCopyWithImpl(this._self, this._then);

  final _NewsDto _self;
  final $Res Function(_NewsDto) _then;

  /// Create a copy of NewsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? authorName = null,
    Object? createdAt = null,
    Object? isRtl = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_NewsDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _self.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRtl: null == isRtl
          ? _self.isRtl
          : isRtl // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
