// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegisterResponseDto _$RegisterResponseDtoFromJson(Map<String, dynamic> json) {
  return _RegisterResponseDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponseDto {
  bool get success => throw _privateConstructorUsedError;
  UserDto get user => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RegisterResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterResponseDtoCopyWith<RegisterResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseDtoCopyWith<$Res> {
  factory $RegisterResponseDtoCopyWith(
    RegisterResponseDto value,
    $Res Function(RegisterResponseDto) then,
  ) = _$RegisterResponseDtoCopyWithImpl<$Res, RegisterResponseDto>;
  @useResult
  $Res call({
    bool success,
    UserDto user,
    String accessToken,
    String refreshToken,
  });

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$RegisterResponseDtoCopyWithImpl<$Res, $Val extends RegisterResponseDto>
    implements $RegisterResponseDtoCopyWith<$Res> {
  _$RegisterResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(
      _value.copyWith(
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserDto,
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

  /// Create a copy of RegisterResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterResponseDtoImplCopyWith<$Res>
    implements $RegisterResponseDtoCopyWith<$Res> {
  factory _$$RegisterResponseDtoImplCopyWith(
    _$RegisterResponseDtoImpl value,
    $Res Function(_$RegisterResponseDtoImpl) then,
  ) = __$$RegisterResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    UserDto user,
    String accessToken,
    String refreshToken,
  });

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$RegisterResponseDtoImplCopyWithImpl<$Res>
    extends _$RegisterResponseDtoCopyWithImpl<$Res, _$RegisterResponseDtoImpl>
    implements _$$RegisterResponseDtoImplCopyWith<$Res> {
  __$$RegisterResponseDtoImplCopyWithImpl(
    _$RegisterResponseDtoImpl _value,
    $Res Function(_$RegisterResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(
      _$RegisterResponseDtoImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserDto,
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
class _$RegisterResponseDtoImpl implements _RegisterResponseDto {
  const _$RegisterResponseDtoImpl({
    required this.success,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory _$RegisterResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseDtoImplFromJson(json);

  @override
  final bool success;
  @override
  final UserDto user;
  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RegisterResponseDto(success: $success, user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseDtoImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, user, accessToken, refreshToken);

  /// Create a copy of RegisterResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseDtoImplCopyWith<_$RegisterResponseDtoImpl> get copyWith =>
      __$$RegisterResponseDtoImplCopyWithImpl<_$RegisterResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterResponseDtoImplToJson(this);
  }
}

abstract class _RegisterResponseDto implements RegisterResponseDto {
  const factory _RegisterResponseDto({
    required final bool success,
    required final UserDto user,
    required final String accessToken,
    required final String refreshToken,
  }) = _$RegisterResponseDtoImpl;

  factory _RegisterResponseDto.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseDtoImpl.fromJson;

  @override
  bool get success;
  @override
  UserDto get user;
  @override
  String get accessToken;
  @override
  String get refreshToken;

  /// Create a copy of RegisterResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterResponseDtoImplCopyWith<_$RegisterResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
