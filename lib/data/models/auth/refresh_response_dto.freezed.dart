// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RefreshResponseDto _$RefreshResponseDtoFromJson(Map<String, dynamic> json) {
  return _RefreshResponseDto.fromJson(json);
}

/// @nodoc
mixin _$RefreshResponseDto {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshResponseDtoCopyWith<RefreshResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshResponseDtoCopyWith<$Res> {
  factory $RefreshResponseDtoCopyWith(
    RefreshResponseDto value,
    $Res Function(RefreshResponseDto) then,
  ) = _$RefreshResponseDtoCopyWithImpl<$Res, RefreshResponseDto>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$RefreshResponseDtoCopyWithImpl<$Res, $Val extends RefreshResponseDto>
    implements $RefreshResponseDtoCopyWith<$Res> {
  _$RefreshResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? refreshToken = null}) {
    return _then(
      _value.copyWith(
            accessToken:
                null == accessToken
                    ? _value.accessToken
                    : accessToken // ignore: cast_nullable_to_non_nullable
                        as String,
            refreshToken:
                null == refreshToken
                    ? _value.refreshToken
                    : refreshToken // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefreshResponseDtoImplCopyWith<$Res>
    implements $RefreshResponseDtoCopyWith<$Res> {
  factory _$$RefreshResponseDtoImplCopyWith(
    _$RefreshResponseDtoImpl value,
    $Res Function(_$RefreshResponseDtoImpl) then,
  ) = __$$RefreshResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$RefreshResponseDtoImplCopyWithImpl<$Res>
    extends _$RefreshResponseDtoCopyWithImpl<$Res, _$RefreshResponseDtoImpl>
    implements _$$RefreshResponseDtoImplCopyWith<$Res> {
  __$$RefreshResponseDtoImplCopyWithImpl(
    _$RefreshResponseDtoImpl _value,
    $Res Function(_$RefreshResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefreshResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? refreshToken = null}) {
    return _then(
      _$RefreshResponseDtoImpl(
        accessToken:
            null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                    as String,
        refreshToken:
            null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshResponseDtoImpl implements _RefreshResponseDto {
  const _$RefreshResponseDtoImpl({
    required this.accessToken,
    required this.refreshToken,
  });

  factory _$RefreshResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshResponseDtoImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshResponseDto(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshResponseDtoImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of RefreshResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshResponseDtoImplCopyWith<_$RefreshResponseDtoImpl> get copyWith =>
      __$$RefreshResponseDtoImplCopyWithImpl<_$RefreshResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshResponseDtoImplToJson(this);
  }
}

abstract class _RefreshResponseDto implements RefreshResponseDto {
  const factory _RefreshResponseDto({
    required final String accessToken,
    required final String refreshToken,
  }) = _$RefreshResponseDtoImpl;

  factory _RefreshResponseDto.fromJson(Map<String, dynamic> json) =
      _$RefreshResponseDtoImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;

  /// Create a copy of RefreshResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshResponseDtoImplCopyWith<_$RefreshResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
