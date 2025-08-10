// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<RoleDto> get roles => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  bool get onboardingCompleted => throw _privateConstructorUsedError;
  bool get isOAuthAccount => throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call({
    String id,
    String username,
    String? name,
    List<RoleDto> roles,
    String? phoneNumber,
    String? avatar,
    bool onboardingCompleted,
    bool isOAuthAccount,
  });
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = freezed,
    Object? roles = null,
    Object? phoneNumber = freezed,
    Object? avatar = freezed,
    Object? onboardingCompleted = null,
    Object? isOAuthAccount = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            username:
                null == username
                    ? _value.username
                    : username // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            roles:
                null == roles
                    ? _value.roles
                    : roles // ignore: cast_nullable_to_non_nullable
                        as List<RoleDto>,
            phoneNumber:
                freezed == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            avatar:
                freezed == avatar
                    ? _value.avatar
                    : avatar // ignore: cast_nullable_to_non_nullable
                        as String?,
            onboardingCompleted:
                null == onboardingCompleted
                    ? _value.onboardingCompleted
                    : onboardingCompleted // ignore: cast_nullable_to_non_nullable
                        as bool,
            isOAuthAccount:
                null == isOAuthAccount
                    ? _value.isOAuthAccount
                    : isOAuthAccount // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
    _$UserDtoImpl value,
    $Res Function(_$UserDtoImpl) then,
  ) = __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String? name,
    List<RoleDto> roles,
    String? phoneNumber,
    String? avatar,
    bool onboardingCompleted,
    bool isOAuthAccount,
  });
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
    _$UserDtoImpl _value,
    $Res Function(_$UserDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = freezed,
    Object? roles = null,
    Object? phoneNumber = freezed,
    Object? avatar = freezed,
    Object? onboardingCompleted = null,
    Object? isOAuthAccount = null,
  }) {
    return _then(
      _$UserDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        username:
            null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        roles:
            null == roles
                ? _value._roles
                : roles // ignore: cast_nullable_to_non_nullable
                    as List<RoleDto>,
        phoneNumber:
            freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        avatar:
            freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                    as String?,
        onboardingCompleted:
            null == onboardingCompleted
                ? _value.onboardingCompleted
                : onboardingCompleted // ignore: cast_nullable_to_non_nullable
                    as bool,
        isOAuthAccount:
            null == isOAuthAccount
                ? _value.isOAuthAccount
                : isOAuthAccount // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl implements _UserDto {
  const _$UserDtoImpl({
    required this.id,
    required this.username,
    this.name,
    required final List<RoleDto> roles,
    this.phoneNumber,
    this.avatar,
    required this.onboardingCompleted,
    required this.isOAuthAccount,
  }) : _roles = roles;

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String? name;
  final List<RoleDto> _roles;
  @override
  List<RoleDto> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? phoneNumber;
  @override
  final String? avatar;
  @override
  final bool onboardingCompleted;
  @override
  final bool isOAuthAccount;

  @override
  String toString() {
    return 'UserDto(id: $id, username: $username, name: $name, roles: $roles, phoneNumber: $phoneNumber, avatar: $avatar, onboardingCompleted: $onboardingCompleted, isOAuthAccount: $isOAuthAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.onboardingCompleted, onboardingCompleted) ||
                other.onboardingCompleted == onboardingCompleted) &&
            (identical(other.isOAuthAccount, isOAuthAccount) ||
                other.isOAuthAccount == isOAuthAccount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    username,
    name,
    const DeepCollectionEquality().hash(_roles),
    phoneNumber,
    avatar,
    onboardingCompleted,
    isOAuthAccount,
  );

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(this);
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto({
    required final String id,
    required final String username,
    final String? name,
    required final List<RoleDto> roles,
    final String? phoneNumber,
    final String? avatar,
    required final bool onboardingCompleted,
    required final bool isOAuthAccount,
  }) = _$UserDtoImpl;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String? get name;
  @override
  List<RoleDto> get roles;
  @override
  String? get phoneNumber;
  @override
  String? get avatar;
  @override
  bool get onboardingCompleted;
  @override
  bool get isOAuthAccount;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
