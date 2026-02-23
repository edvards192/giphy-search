// Typed DTOs for Giphy API JSON responses.
// These models mirror the API structure and are used for parsing before mapping to GifModel.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'giphy_response.freezed.dart';
part 'giphy_response.g.dart';

@freezed
class GiphyResponse with _$GiphyResponse {
  // Root response object containing a list of GIFs.
  const factory GiphyResponse({
    required List<GiphyGif> data,
  }) = _GiphyResponse;

  factory GiphyResponse.fromJson(Map<String, dynamic> json) =>
      _$GiphyResponseFromJson(json);
}

@freezed
class GiphyGif with _$GiphyGif {
  // Single GIF structure returned by API
  const factory GiphyGif({
    required String id,
    String? title,
    required GiphyImages images,
    GiphyUser? user,
    String? rating,
  }) = _GiphyGif;

  factory GiphyGif.fromJson(Map<String, dynamic> json) =>
      _$GiphyGifFromJson(json);
}

@freezed
class GiphyImages with _$GiphyImages {
  // Commonly used image renditions for preview/detail screens.
  const factory GiphyImages({
    @JsonKey(name: 'fixed_width') GiphyImage? fixedWidth,
    GiphyImage? downsized,
    GiphyImage? original,
  }) = _GiphyImages;

  factory GiphyImages.fromJson(Map<String, dynamic> json) =>
      _$GiphyImagesFromJson(json);
}

@freezed
class GiphyImage with _$GiphyImage {
  // One image rendition metadata.
  const factory GiphyImage({
    required String url,
    String? width,
    String? height,
  }) = _GiphyImage;

  factory GiphyImage.fromJson(Map<String, dynamic> json) =>
      _$GiphyImageFromJson(json);
}

@freezed
class GiphyUser with _$GiphyUser {
  // Optional user profile attached to a GIF.
  const factory GiphyUser({
    required String username,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _GiphyUser;

  factory GiphyUser.fromJson(Map<String, dynamic> json) =>
      _$GiphyUserFromJson(json);
}
