// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiphyResponseImpl _$$GiphyResponseImplFromJson(Map<String, dynamic> json) =>
    _$GiphyResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => GiphyGif.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GiphyResponseImplToJson(_$GiphyResponseImpl instance) =>
    <String, dynamic>{'data': instance.data};

_$GiphyGifImpl _$$GiphyGifImplFromJson(Map<String, dynamic> json) =>
    _$GiphyGifImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      images: GiphyImages.fromJson(json['images'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : GiphyUser.fromJson(json['user'] as Map<String, dynamic>),
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$$GiphyGifImplToJson(_$GiphyGifImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'user': instance.user,
      'rating': instance.rating,
    };

_$GiphyImagesImpl _$$GiphyImagesImplFromJson(Map<String, dynamic> json) =>
    _$GiphyImagesImpl(
      fixedWidth: json['fixed_width'] == null
          ? null
          : GiphyImage.fromJson(json['fixed_width'] as Map<String, dynamic>),
      downsized: json['downsized'] == null
          ? null
          : GiphyImage.fromJson(json['downsized'] as Map<String, dynamic>),
      original: json['original'] == null
          ? null
          : GiphyImage.fromJson(json['original'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GiphyImagesImplToJson(_$GiphyImagesImpl instance) =>
    <String, dynamic>{
      'fixed_width': instance.fixedWidth,
      'downsized': instance.downsized,
      'original': instance.original,
    };

_$GiphyImageImpl _$$GiphyImageImplFromJson(Map<String, dynamic> json) =>
    _$GiphyImageImpl(
      url: json['url'] as String,
      width: json['width'] as String?,
      height: json['height'] as String?,
    );

Map<String, dynamic> _$$GiphyImageImplToJson(_$GiphyImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$GiphyUserImpl _$$GiphyUserImplFromJson(Map<String, dynamic> json) =>
    _$GiphyUserImpl(
      username: json['username'] as String,
      displayName: json['display_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$GiphyUserImplToJson(_$GiphyUserImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
    };
