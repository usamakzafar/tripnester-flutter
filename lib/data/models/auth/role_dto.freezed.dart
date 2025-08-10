// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RoleDto _$RoleDtoFromJson(Map<String, dynamic> json) {
  return _RoleDto.fromJson(json);
}

/// @nodoc
mixin _$RoleDto {
  String get id => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Serializes this RoleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleDtoCopyWith<RoleDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleDtoCopyWith<$Res> {
  factory $RoleDtoCopyWith(RoleDto value, $Res Function(RoleDto) then) =
      _$RoleDtoCopyWithImpl<$Res, RoleDto>;
  @useResult
  $Res call({String id, String role});
}

/// @nodoc
class _$RoleDtoCopyWithImpl<$Res, $Val extends RoleDto>
    implements $RoleDtoCopyWith<$Res> {
  _$RoleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? role = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            role:
                null == role
                    ? _value.role
                    : role // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RoleDtoImplCopyWith<$Res> implements $RoleDtoCopyWith<$Res> {
  factory _$$RoleDtoImplCopyWith(
    _$RoleDtoImpl value,
    $Res Function(_$RoleDtoImpl) then,
  ) = __$$RoleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String role});
}

/// @nodoc
class __$$RoleDtoImplCopyWithImpl<$Res>
    extends _$RoleDtoCopyWithImpl<$Res, _$RoleDtoImpl>
    implements _$$RoleDtoImplCopyWith<$Res> {
  __$$RoleDtoImplCopyWithImpl(
    _$RoleDtoImpl _value,
    $Res Function(_$RoleDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? role = null}) {
    return _then(
      _$RoleDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        role:
            null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleDtoImpl implements _RoleDto {
  const _$RoleDtoImpl({required this.id, required this.role});

  factory _$RoleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String role;

  @override
  String toString() {
    return 'RoleDto(id: $id, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, role);

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleDtoImplCopyWith<_$RoleDtoImpl> get copyWith =>
      __$$RoleDtoImplCopyWithImpl<_$RoleDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleDtoImplToJson(this);
  }
}

abstract class _RoleDto implements RoleDto {
  const factory _RoleDto({
    required final String id,
    required final String role,
  }) = _$RoleDtoImpl;

  factory _RoleDto.fromJson(Map<String, dynamic> json) = _$RoleDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get role;

  /// Create a copy of RoleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleDtoImplCopyWith<_$RoleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
