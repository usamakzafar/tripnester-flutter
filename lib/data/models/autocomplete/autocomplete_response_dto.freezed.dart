// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AutocompleteResponseDto _$AutocompleteResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _AutocompleteResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AutocompleteResponseDto {
  AutocompleteRegionsDto get regions => throw _privateConstructorUsedError;
  AutocompletePropertyResultDto get properties =>
      throw _privateConstructorUsedError;

  /// Serializes this AutocompleteResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutocompleteResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutocompleteResponseDtoCopyWith<AutocompleteResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteResponseDtoCopyWith<$Res> {
  factory $AutocompleteResponseDtoCopyWith(
    AutocompleteResponseDto value,
    $Res Function(AutocompleteResponseDto) then,
  ) = _$AutocompleteResponseDtoCopyWithImpl<$Res, AutocompleteResponseDto>;
  @useResult
  $Res call({
    AutocompleteRegionsDto regions,
    AutocompletePropertyResultDto properties,
  });

  $AutocompleteRegionsDtoCopyWith<$Res> get regions;
  $AutocompletePropertyResultDtoCopyWith<$Res> get properties;
}

/// @nodoc
class _$AutocompleteResponseDtoCopyWithImpl<
  $Res,
  $Val extends AutocompleteResponseDto
>
    implements $AutocompleteResponseDtoCopyWith<$Res> {
  _$AutocompleteResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutocompleteResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? regions = null, Object? properties = null}) {
    return _then(
      _value.copyWith(
            regions:
                null == regions
                    ? _value.regions
                    : regions // ignore: cast_nullable_to_non_nullable
                        as AutocompleteRegionsDto,
            properties:
                null == properties
                    ? _value.properties
                    : properties // ignore: cast_nullable_to_non_nullable
                        as AutocompletePropertyResultDto,
          )
          as $Val,
    );
  }

  /// Create a copy of AutocompleteResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AutocompleteRegionsDtoCopyWith<$Res> get regions {
    return $AutocompleteRegionsDtoCopyWith<$Res>(_value.regions, (value) {
      return _then(_value.copyWith(regions: value) as $Val);
    });
  }

  /// Create a copy of AutocompleteResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AutocompletePropertyResultDtoCopyWith<$Res> get properties {
    return $AutocompletePropertyResultDtoCopyWith<$Res>(_value.properties, (
      value,
    ) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AutocompleteResponseDtoImplCopyWith<$Res>
    implements $AutocompleteResponseDtoCopyWith<$Res> {
  factory _$$AutocompleteResponseDtoImplCopyWith(
    _$AutocompleteResponseDtoImpl value,
    $Res Function(_$AutocompleteResponseDtoImpl) then,
  ) = __$$AutocompleteResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AutocompleteRegionsDto regions,
    AutocompletePropertyResultDto properties,
  });

  @override
  $AutocompleteRegionsDtoCopyWith<$Res> get regions;
  @override
  $AutocompletePropertyResultDtoCopyWith<$Res> get properties;
}

/// @nodoc
class __$$AutocompleteResponseDtoImplCopyWithImpl<$Res>
    extends
        _$AutocompleteResponseDtoCopyWithImpl<
          $Res,
          _$AutocompleteResponseDtoImpl
        >
    implements _$$AutocompleteResponseDtoImplCopyWith<$Res> {
  __$$AutocompleteResponseDtoImplCopyWithImpl(
    _$AutocompleteResponseDtoImpl _value,
    $Res Function(_$AutocompleteResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompleteResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? regions = null, Object? properties = null}) {
    return _then(
      _$AutocompleteResponseDtoImpl(
        regions:
            null == regions
                ? _value.regions
                : regions // ignore: cast_nullable_to_non_nullable
                    as AutocompleteRegionsDto,
        properties:
            null == properties
                ? _value.properties
                : properties // ignore: cast_nullable_to_non_nullable
                    as AutocompletePropertyResultDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompleteResponseDtoImpl extends _AutocompleteResponseDto {
  const _$AutocompleteResponseDtoImpl({
    required this.regions,
    required this.properties,
  }) : super._();

  factory _$AutocompleteResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutocompleteResponseDtoImplFromJson(json);

  @override
  final AutocompleteRegionsDto regions;
  @override
  final AutocompletePropertyResultDto properties;

  @override
  String toString() {
    return 'AutocompleteResponseDto(regions: $regions, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompleteResponseDtoImpl &&
            (identical(other.regions, regions) || other.regions == regions) &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, regions, properties);

  /// Create a copy of AutocompleteResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompleteResponseDtoImplCopyWith<_$AutocompleteResponseDtoImpl>
  get copyWith => __$$AutocompleteResponseDtoImplCopyWithImpl<
    _$AutocompleteResponseDtoImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompleteResponseDtoImplToJson(this);
  }
}

abstract class _AutocompleteResponseDto extends AutocompleteResponseDto {
  const factory _AutocompleteResponseDto({
    required final AutocompleteRegionsDto regions,
    required final AutocompletePropertyResultDto properties,
  }) = _$AutocompleteResponseDtoImpl;
  const _AutocompleteResponseDto._() : super._();

  factory _AutocompleteResponseDto.fromJson(Map<String, dynamic> json) =
      _$AutocompleteResponseDtoImpl.fromJson;

  @override
  AutocompleteRegionsDto get regions;
  @override
  AutocompletePropertyResultDto get properties;

  /// Create a copy of AutocompleteResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutocompleteResponseDtoImplCopyWith<_$AutocompleteResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
