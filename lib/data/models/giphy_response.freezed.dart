// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'giphy_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GiphyResponse _$GiphyResponseFromJson(Map<String, dynamic> json) {
  return _GiphyResponse.fromJson(json);
}

/// @nodoc
mixin _$GiphyResponse {
  List<GiphyGif> get data => throw _privateConstructorUsedError;

  /// Serializes this GiphyResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiphyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiphyResponseCopyWith<GiphyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiphyResponseCopyWith<$Res> {
  factory $GiphyResponseCopyWith(
    GiphyResponse value,
    $Res Function(GiphyResponse) then,
  ) = _$GiphyResponseCopyWithImpl<$Res, GiphyResponse>;
  @useResult
  $Res call({List<GiphyGif> data});
}

/// @nodoc
class _$GiphyResponseCopyWithImpl<$Res, $Val extends GiphyResponse>
    implements $GiphyResponseCopyWith<$Res> {
  _$GiphyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiphyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<GiphyGif>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GiphyResponseImplCopyWith<$Res>
    implements $GiphyResponseCopyWith<$Res> {
  factory _$$GiphyResponseImplCopyWith(
    _$GiphyResponseImpl value,
    $Res Function(_$GiphyResponseImpl) then,
  ) = __$$GiphyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GiphyGif> data});
}

/// @nodoc
class __$$GiphyResponseImplCopyWithImpl<$Res>
    extends _$GiphyResponseCopyWithImpl<$Res, _$GiphyResponseImpl>
    implements _$$GiphyResponseImplCopyWith<$Res> {
  __$$GiphyResponseImplCopyWithImpl(
    _$GiphyResponseImpl _value,
    $Res Function(_$GiphyResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GiphyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$GiphyResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<GiphyGif>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GiphyResponseImpl implements _GiphyResponse {
  const _$GiphyResponseImpl({required final List<GiphyGif> data})
    : _data = data;

  factory _$GiphyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiphyResponseImplFromJson(json);

  final List<GiphyGif> _data;
  @override
  List<GiphyGif> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GiphyResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiphyResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of GiphyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiphyResponseImplCopyWith<_$GiphyResponseImpl> get copyWith =>
      __$$GiphyResponseImplCopyWithImpl<_$GiphyResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiphyResponseImplToJson(this);
  }
}

abstract class _GiphyResponse implements GiphyResponse {
  const factory _GiphyResponse({required final List<GiphyGif> data}) =
      _$GiphyResponseImpl;

  factory _GiphyResponse.fromJson(Map<String, dynamic> json) =
      _$GiphyResponseImpl.fromJson;

  @override
  List<GiphyGif> get data;

  /// Create a copy of GiphyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiphyResponseImplCopyWith<_$GiphyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiphyGif _$GiphyGifFromJson(Map<String, dynamic> json) {
  return _GiphyGif.fromJson(json);
}

/// @nodoc
mixin _$GiphyGif {
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  GiphyImages get images => throw _privateConstructorUsedError;
  GiphyUser? get user => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;

  /// Serializes this GiphyGif to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiphyGif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiphyGifCopyWith<GiphyGif> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiphyGifCopyWith<$Res> {
  factory $GiphyGifCopyWith(GiphyGif value, $Res Function(GiphyGif) then) =
      _$GiphyGifCopyWithImpl<$Res, GiphyGif>;
  @useResult
  $Res call({
    String id,
    String? title,
    GiphyImages images,
    GiphyUser? user,
    String? rating,
  });

  $GiphyImagesCopyWith<$Res> get images;
  $GiphyUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$GiphyGifCopyWithImpl<$Res, $Val extends GiphyGif>
    implements $GiphyGifCopyWith<$Res> {
  _$GiphyGifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiphyGif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? images = null,
    Object? user = freezed,
    Object? rating = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as GiphyImages,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as GiphyUser?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of GiphyGif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiphyImagesCopyWith<$Res> get images {
    return $GiphyImagesCopyWith<$Res>(_value.images, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }

  /// Create a copy of GiphyGif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiphyUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $GiphyUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiphyGifImplCopyWith<$Res>
    implements $GiphyGifCopyWith<$Res> {
  factory _$$GiphyGifImplCopyWith(
    _$GiphyGifImpl value,
    $Res Function(_$GiphyGifImpl) then,
  ) = __$$GiphyGifImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? title,
    GiphyImages images,
    GiphyUser? user,
    String? rating,
  });

  @override
  $GiphyImagesCopyWith<$Res> get images;
  @override
  $GiphyUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GiphyGifImplCopyWithImpl<$Res>
    extends _$GiphyGifCopyWithImpl<$Res, _$GiphyGifImpl>
    implements _$$GiphyGifImplCopyWith<$Res> {
  __$$GiphyGifImplCopyWithImpl(
    _$GiphyGifImpl _value,
    $Res Function(_$GiphyGifImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GiphyGif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? images = null,
    Object? user = freezed,
    Object? rating = freezed,
  }) {
    return _then(
      _$GiphyGifImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        images: null == images
            ? _value.images
            : images // ignore: cast_nullable_to_non_nullable
                  as GiphyImages,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as GiphyUser?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GiphyGifImpl implements _GiphyGif {
  const _$GiphyGifImpl({
    required this.id,
    this.title,
    required this.images,
    this.user,
    this.rating,
  });

  factory _$GiphyGifImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiphyGifImplFromJson(json);

  @override
  final String id;
  @override
  final String? title;
  @override
  final GiphyImages images;
  @override
  final GiphyUser? user;
  @override
  final String? rating;

  @override
  String toString() {
    return 'GiphyGif(id: $id, title: $title, images: $images, user: $user, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiphyGifImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, images, user, rating);

  /// Create a copy of GiphyGif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiphyGifImplCopyWith<_$GiphyGifImpl> get copyWith =>
      __$$GiphyGifImplCopyWithImpl<_$GiphyGifImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiphyGifImplToJson(this);
  }
}

abstract class _GiphyGif implements GiphyGif {
  const factory _GiphyGif({
    required final String id,
    final String? title,
    required final GiphyImages images,
    final GiphyUser? user,
    final String? rating,
  }) = _$GiphyGifImpl;

  factory _GiphyGif.fromJson(Map<String, dynamic> json) =
      _$GiphyGifImpl.fromJson;

  @override
  String get id;
  @override
  String? get title;
  @override
  GiphyImages get images;
  @override
  GiphyUser? get user;
  @override
  String? get rating;

  /// Create a copy of GiphyGif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiphyGifImplCopyWith<_$GiphyGifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiphyImages _$GiphyImagesFromJson(Map<String, dynamic> json) {
  return _GiphyImages.fromJson(json);
}

/// @nodoc
mixin _$GiphyImages {
  @JsonKey(name: 'fixed_width')
  GiphyImage? get fixedWidth => throw _privateConstructorUsedError;
  GiphyImage? get downsized => throw _privateConstructorUsedError;
  GiphyImage? get original => throw _privateConstructorUsedError;

  /// Serializes this GiphyImages to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiphyImagesCopyWith<GiphyImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiphyImagesCopyWith<$Res> {
  factory $GiphyImagesCopyWith(
    GiphyImages value,
    $Res Function(GiphyImages) then,
  ) = _$GiphyImagesCopyWithImpl<$Res, GiphyImages>;
  @useResult
  $Res call({
    @JsonKey(name: 'fixed_width') GiphyImage? fixedWidth,
    GiphyImage? downsized,
    GiphyImage? original,
  });

  $GiphyImageCopyWith<$Res>? get fixedWidth;
  $GiphyImageCopyWith<$Res>? get downsized;
  $GiphyImageCopyWith<$Res>? get original;
}

/// @nodoc
class _$GiphyImagesCopyWithImpl<$Res, $Val extends GiphyImages>
    implements $GiphyImagesCopyWith<$Res> {
  _$GiphyImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fixedWidth = freezed,
    Object? downsized = freezed,
    Object? original = freezed,
  }) {
    return _then(
      _value.copyWith(
            fixedWidth: freezed == fixedWidth
                ? _value.fixedWidth
                : fixedWidth // ignore: cast_nullable_to_non_nullable
                      as GiphyImage?,
            downsized: freezed == downsized
                ? _value.downsized
                : downsized // ignore: cast_nullable_to_non_nullable
                      as GiphyImage?,
            original: freezed == original
                ? _value.original
                : original // ignore: cast_nullable_to_non_nullable
                      as GiphyImage?,
          )
          as $Val,
    );
  }

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiphyImageCopyWith<$Res>? get fixedWidth {
    if (_value.fixedWidth == null) {
      return null;
    }

    return $GiphyImageCopyWith<$Res>(_value.fixedWidth!, (value) {
      return _then(_value.copyWith(fixedWidth: value) as $Val);
    });
  }

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiphyImageCopyWith<$Res>? get downsized {
    if (_value.downsized == null) {
      return null;
    }

    return $GiphyImageCopyWith<$Res>(_value.downsized!, (value) {
      return _then(_value.copyWith(downsized: value) as $Val);
    });
  }

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiphyImageCopyWith<$Res>? get original {
    if (_value.original == null) {
      return null;
    }

    return $GiphyImageCopyWith<$Res>(_value.original!, (value) {
      return _then(_value.copyWith(original: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiphyImagesImplCopyWith<$Res>
    implements $GiphyImagesCopyWith<$Res> {
  factory _$$GiphyImagesImplCopyWith(
    _$GiphyImagesImpl value,
    $Res Function(_$GiphyImagesImpl) then,
  ) = __$$GiphyImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'fixed_width') GiphyImage? fixedWidth,
    GiphyImage? downsized,
    GiphyImage? original,
  });

  @override
  $GiphyImageCopyWith<$Res>? get fixedWidth;
  @override
  $GiphyImageCopyWith<$Res>? get downsized;
  @override
  $GiphyImageCopyWith<$Res>? get original;
}

/// @nodoc
class __$$GiphyImagesImplCopyWithImpl<$Res>
    extends _$GiphyImagesCopyWithImpl<$Res, _$GiphyImagesImpl>
    implements _$$GiphyImagesImplCopyWith<$Res> {
  __$$GiphyImagesImplCopyWithImpl(
    _$GiphyImagesImpl _value,
    $Res Function(_$GiphyImagesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fixedWidth = freezed,
    Object? downsized = freezed,
    Object? original = freezed,
  }) {
    return _then(
      _$GiphyImagesImpl(
        fixedWidth: freezed == fixedWidth
            ? _value.fixedWidth
            : fixedWidth // ignore: cast_nullable_to_non_nullable
                  as GiphyImage?,
        downsized: freezed == downsized
            ? _value.downsized
            : downsized // ignore: cast_nullable_to_non_nullable
                  as GiphyImage?,
        original: freezed == original
            ? _value.original
            : original // ignore: cast_nullable_to_non_nullable
                  as GiphyImage?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GiphyImagesImpl implements _GiphyImages {
  const _$GiphyImagesImpl({
    @JsonKey(name: 'fixed_width') this.fixedWidth,
    this.downsized,
    this.original,
  });

  factory _$GiphyImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiphyImagesImplFromJson(json);

  @override
  @JsonKey(name: 'fixed_width')
  final GiphyImage? fixedWidth;
  @override
  final GiphyImage? downsized;
  @override
  final GiphyImage? original;

  @override
  String toString() {
    return 'GiphyImages(fixedWidth: $fixedWidth, downsized: $downsized, original: $original)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiphyImagesImpl &&
            (identical(other.fixedWidth, fixedWidth) ||
                other.fixedWidth == fixedWidth) &&
            (identical(other.downsized, downsized) ||
                other.downsized == downsized) &&
            (identical(other.original, original) ||
                other.original == original));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fixedWidth, downsized, original);

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiphyImagesImplCopyWith<_$GiphyImagesImpl> get copyWith =>
      __$$GiphyImagesImplCopyWithImpl<_$GiphyImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiphyImagesImplToJson(this);
  }
}

abstract class _GiphyImages implements GiphyImages {
  const factory _GiphyImages({
    @JsonKey(name: 'fixed_width') final GiphyImage? fixedWidth,
    final GiphyImage? downsized,
    final GiphyImage? original,
  }) = _$GiphyImagesImpl;

  factory _GiphyImages.fromJson(Map<String, dynamic> json) =
      _$GiphyImagesImpl.fromJson;

  @override
  @JsonKey(name: 'fixed_width')
  GiphyImage? get fixedWidth;
  @override
  GiphyImage? get downsized;
  @override
  GiphyImage? get original;

  /// Create a copy of GiphyImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiphyImagesImplCopyWith<_$GiphyImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiphyImage _$GiphyImageFromJson(Map<String, dynamic> json) {
  return _GiphyImage.fromJson(json);
}

/// @nodoc
mixin _$GiphyImage {
  String get url => throw _privateConstructorUsedError;
  String? get width => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;

  /// Serializes this GiphyImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiphyImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiphyImageCopyWith<GiphyImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiphyImageCopyWith<$Res> {
  factory $GiphyImageCopyWith(
    GiphyImage value,
    $Res Function(GiphyImage) then,
  ) = _$GiphyImageCopyWithImpl<$Res, GiphyImage>;
  @useResult
  $Res call({String url, String? width, String? height});
}

/// @nodoc
class _$GiphyImageCopyWithImpl<$Res, $Val extends GiphyImage>
    implements $GiphyImageCopyWith<$Res> {
  _$GiphyImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiphyImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            width: freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as String?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GiphyImageImplCopyWith<$Res>
    implements $GiphyImageCopyWith<$Res> {
  factory _$$GiphyImageImplCopyWith(
    _$GiphyImageImpl value,
    $Res Function(_$GiphyImageImpl) then,
  ) = __$$GiphyImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String? width, String? height});
}

/// @nodoc
class __$$GiphyImageImplCopyWithImpl<$Res>
    extends _$GiphyImageCopyWithImpl<$Res, _$GiphyImageImpl>
    implements _$$GiphyImageImplCopyWith<$Res> {
  __$$GiphyImageImplCopyWithImpl(
    _$GiphyImageImpl _value,
    $Res Function(_$GiphyImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GiphyImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(
      _$GiphyImageImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as String?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GiphyImageImpl implements _GiphyImage {
  const _$GiphyImageImpl({required this.url, this.width, this.height});

  factory _$GiphyImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiphyImageImplFromJson(json);

  @override
  final String url;
  @override
  final String? width;
  @override
  final String? height;

  @override
  String toString() {
    return 'GiphyImage(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiphyImageImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  /// Create a copy of GiphyImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiphyImageImplCopyWith<_$GiphyImageImpl> get copyWith =>
      __$$GiphyImageImplCopyWithImpl<_$GiphyImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiphyImageImplToJson(this);
  }
}

abstract class _GiphyImage implements GiphyImage {
  const factory _GiphyImage({
    required final String url,
    final String? width,
    final String? height,
  }) = _$GiphyImageImpl;

  factory _GiphyImage.fromJson(Map<String, dynamic> json) =
      _$GiphyImageImpl.fromJson;

  @override
  String get url;
  @override
  String? get width;
  @override
  String? get height;

  /// Create a copy of GiphyImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiphyImageImplCopyWith<_$GiphyImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GiphyUser _$GiphyUserFromJson(Map<String, dynamic> json) {
  return _GiphyUser.fromJson(json);
}

/// @nodoc
mixin _$GiphyUser {
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this GiphyUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiphyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiphyUserCopyWith<GiphyUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiphyUserCopyWith<$Res> {
  factory $GiphyUserCopyWith(GiphyUser value, $Res Function(GiphyUser) then) =
      _$GiphyUserCopyWithImpl<$Res, GiphyUser>;
  @useResult
  $Res call({
    String username,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  });
}

/// @nodoc
class _$GiphyUserCopyWithImpl<$Res, $Val extends GiphyUser>
    implements $GiphyUserCopyWith<$Res> {
  _$GiphyUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiphyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GiphyUserImplCopyWith<$Res>
    implements $GiphyUserCopyWith<$Res> {
  factory _$$GiphyUserImplCopyWith(
    _$GiphyUserImpl value,
    $Res Function(_$GiphyUserImpl) then,
  ) = __$$GiphyUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String username,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  });
}

/// @nodoc
class __$$GiphyUserImplCopyWithImpl<$Res>
    extends _$GiphyUserCopyWithImpl<$Res, _$GiphyUserImpl>
    implements _$$GiphyUserImplCopyWith<$Res> {
  __$$GiphyUserImplCopyWithImpl(
    _$GiphyUserImpl _value,
    $Res Function(_$GiphyUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GiphyUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$GiphyUserImpl(
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GiphyUserImpl implements _GiphyUser {
  const _$GiphyUserImpl({
    required this.username,
    @JsonKey(name: 'display_name') this.displayName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
  });

  factory _$GiphyUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiphyUserImplFromJson(json);

  @override
  final String username;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @override
  String toString() {
    return 'GiphyUser(username: $username, displayName: $displayName, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiphyUserImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, displayName, avatarUrl);

  /// Create a copy of GiphyUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiphyUserImplCopyWith<_$GiphyUserImpl> get copyWith =>
      __$$GiphyUserImplCopyWithImpl<_$GiphyUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiphyUserImplToJson(this);
  }
}

abstract class _GiphyUser implements GiphyUser {
  const factory _GiphyUser({
    required final String username,
    @JsonKey(name: 'display_name') final String? displayName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
  }) = _$GiphyUserImpl;

  factory _GiphyUser.fromJson(Map<String, dynamic> json) =
      _$GiphyUserImpl.fromJson;

  @override
  String get username;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;

  /// Create a copy of GiphyUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiphyUserImplCopyWith<_$GiphyUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
