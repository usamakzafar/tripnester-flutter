// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) {
  return _LoginResponseDto.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseDto {
  bool get success => throw _privateConstructorUsedError;
  UserDto get user => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this LoginResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseDtoCopyWith<LoginResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseDtoCopyWith<$Res> {
  factory $LoginResponseDtoCopyWith(
    LoginResponseDto value,
    $Res Function(LoginResponseDto) then,
  ) = _$LoginResponseDtoCopyWithImpl<$Res, LoginResponseDto>;
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
class _$LoginResponseDtoCopyWithImpl<$Res, $Val extends LoginResponseDto>
    implements $LoginResponseDtoCopyWith<$Res> {
  _$LoginResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponseDto
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

  /// Create a copy of LoginResponseDto
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
abstract class _$$LoginResponseDtoImplCopyWith<$Res>
    implements $LoginResponseDtoCopyWith<$Res> {
  factory _$$LoginResponseDtoImplCopyWith(
    _$LoginResponseDtoImpl value,
    $Res Function(_$LoginResponseDtoImpl) then,
  ) = __$$LoginResponseDtoImplCopyWithImpl<$Res>;
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
class __$$LoginResponseDtoImplCopyWithImpl<$Res>
    extends _$LoginResponseDtoCopyWithImpl<$Res, _$LoginResponseDtoImpl>
    implements _$$LoginResponseDtoImplCopyWith<$Res> {
  __$$LoginResponseDtoImplCopyWithImpl(
    _$LoginResponseDtoImpl _value,
    $Res Function(_$LoginResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResponseDto
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
      _$LoginResponseDtoImpl(
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
class _$LoginResponseDtoImpl implements _LoginResponseDto {
  const _$LoginResponseDtoImpl({
    required this.success,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory _$LoginResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseDtoImplFromJson(json);

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
    return 'LoginResponseDto(success: $success, user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseDtoImpl &&
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

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseDtoImplCopyWith<_$LoginResponseDtoImpl> get copyWith =>
      __$$LoginResponseDtoImplCopyWithImpl<_$LoginResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseDtoImplToJson(this);
  }
}

abstract class _LoginResponseDto implements LoginResponseDto {
  const factory _LoginResponseDto({
    required final bool success,
    required final UserDto user,
    required final String accessToken,
    required final String refreshToken,
  }) = _$LoginResponseDtoImpl;

  factory _LoginResponseDto.fromJson(Map<String, dynamic> json) =
      _$LoginResponseDtoImpl.fromJson;

  @override
  bool get success;
  @override
  UserDto get user;
  @override
  String get accessToken;
  @override
  String get refreshToken;

  /// Create a copy of LoginResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseDtoImplCopyWith<_$LoginResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
