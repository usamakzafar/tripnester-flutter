// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegionDto _$RegionDtoFromJson(Map<String, dynamic> json) {
  return _RegionDto.fromJson(json);
}

/// @nodoc
mixin _$RegionDto {
  String get name => throw _privateConstructorUsedError;
  String get regionId => throw _privateConstructorUsedError;
  String get regionType => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  LocationDto get location => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get countryName => throw _privateConstructorUsedError;

  /// Serializes this RegionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionDtoCopyWith<RegionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionDtoCopyWith<$Res> {
  factory $RegionDtoCopyWith(RegionDto value, $Res Function(RegionDto) then) =
      _$RegionDtoCopyWithImpl<$Res, RegionDto>;
  @useResult
  $Res call({
    String name,
    String regionId,
    String regionType,
    int priority,
    LocationDto location,
    String countryCode,
    String countryName,
  });

  $LocationDtoCopyWith<$Res> get location;
}

/// @nodoc
class _$RegionDtoCopyWithImpl<$Res, $Val extends RegionDto>
    implements $RegionDtoCopyWith<$Res> {
  _$RegionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? regionId = null,
    Object? regionType = null,
    Object? priority = null,
    Object? location = null,
    Object? countryCode = null,
    Object? countryName = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            regionId:
                null == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as String,
            regionType:
                null == regionType
                    ? _value.regionType
                    : regionType // ignore: cast_nullable_to_non_nullable
                        as String,
            priority:
                null == priority
                    ? _value.priority
                    : priority // ignore: cast_nullable_to_non_nullable
                        as int,
            location:
                null == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as LocationDto,
            countryCode:
                null == countryCode
                    ? _value.countryCode
                    : countryCode // ignore: cast_nullable_to_non_nullable
                        as String,
            countryName:
                null == countryName
                    ? _value.countryName
                    : countryName // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of RegionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDtoCopyWith<$Res> get location {
    return $LocationDtoCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegionDtoImplCopyWith<$Res>
    implements $RegionDtoCopyWith<$Res> {
  factory _$$RegionDtoImplCopyWith(
    _$RegionDtoImpl value,
    $Res Function(_$RegionDtoImpl) then,
  ) = __$$RegionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String regionId,
    String regionType,
    int priority,
    LocationDto location,
    String countryCode,
    String countryName,
  });

  @override
  $LocationDtoCopyWith<$Res> get location;
}

/// @nodoc
class __$$RegionDtoImplCopyWithImpl<$Res>
    extends _$RegionDtoCopyWithImpl<$Res, _$RegionDtoImpl>
    implements _$$RegionDtoImplCopyWith<$Res> {
  __$$RegionDtoImplCopyWithImpl(
    _$RegionDtoImpl _value,
    $Res Function(_$RegionDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? regionId = null,
    Object? regionType = null,
    Object? priority = null,
    Object? location = null,
    Object? countryCode = null,
    Object? countryName = null,
  }) {
    return _then(
      _$RegionDtoImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        regionId:
            null == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as String,
        regionType:
            null == regionType
                ? _value.regionType
                : regionType // ignore: cast_nullable_to_non_nullable
                    as String,
        priority:
            null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                    as int,
        location:
            null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as LocationDto,
        countryCode:
            null == countryCode
                ? _value.countryCode
                : countryCode // ignore: cast_nullable_to_non_nullable
                    as String,
        countryName:
            null == countryName
                ? _value.countryName
                : countryName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionDtoImpl extends _RegionDto {
  const _$RegionDtoImpl({
    required this.name,
    required this.regionId,
    required this.regionType,
    required this.priority,
    required this.location,
    required this.countryCode,
    required this.countryName,
  }) : super._();

  factory _$RegionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String regionId;
  @override
  final String regionType;
  @override
  final int priority;
  @override
  final LocationDto location;
  @override
  final String countryCode;
  @override
  final String countryName;

  @override
  String toString() {
    return 'RegionDto(name: $name, regionId: $regionId, regionType: $regionType, priority: $priority, location: $location, countryCode: $countryCode, countryName: $countryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.regionType, regionType) ||
                other.regionType == regionType) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    regionId,
    regionType,
    priority,
    location,
    countryCode,
    countryName,
  );

  /// Create a copy of RegionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionDtoImplCopyWith<_$RegionDtoImpl> get copyWith =>
      __$$RegionDtoImplCopyWithImpl<_$RegionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionDtoImplToJson(this);
  }
}

abstract class _RegionDto extends RegionDto {
  const factory _RegionDto({
    required final String name,
    required final String regionId,
    required final String regionType,
    required final int priority,
    required final LocationDto location,
    required final String countryCode,
    required final String countryName,
  }) = _$RegionDtoImpl;
  const _RegionDto._() : super._();

  factory _RegionDto.fromJson(Map<String, dynamic> json) =
      _$RegionDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get regionId;
  @override
  String get regionType;
  @override
  int get priority;
  @override
  LocationDto get location;
  @override
  String get countryCode;
  @override
  String get countryName;

  /// Create a copy of RegionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionDtoImplCopyWith<_$RegionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
