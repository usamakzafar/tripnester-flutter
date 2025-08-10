// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete_regions_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AutocompleteRegionsDto _$AutocompleteRegionsDtoFromJson(
  Map<String, dynamic> json,
) {
  return _AutocompleteRegionsDto.fromJson(json);
}

/// @nodoc
mixin _$AutocompleteRegionsDto {
  List<RegionDto> get results => throw _privateConstructorUsedError;

  /// Serializes this AutocompleteRegionsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutocompleteRegionsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutocompleteRegionsDtoCopyWith<AutocompleteRegionsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteRegionsDtoCopyWith<$Res> {
  factory $AutocompleteRegionsDtoCopyWith(
    AutocompleteRegionsDto value,
    $Res Function(AutocompleteRegionsDto) then,
  ) = _$AutocompleteRegionsDtoCopyWithImpl<$Res, AutocompleteRegionsDto>;
  @useResult
  $Res call({List<RegionDto> results});
}

/// @nodoc
class _$AutocompleteRegionsDtoCopyWithImpl<
  $Res,
  $Val extends AutocompleteRegionsDto
>
    implements $AutocompleteRegionsDtoCopyWith<$Res> {
  _$AutocompleteRegionsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutocompleteRegionsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null}) {
    return _then(
      _value.copyWith(
            results:
                null == results
                    ? _value.results
                    : results // ignore: cast_nullable_to_non_nullable
                        as List<RegionDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AutocompleteRegionsDtoImplCopyWith<$Res>
    implements $AutocompleteRegionsDtoCopyWith<$Res> {
  factory _$$AutocompleteRegionsDtoImplCopyWith(
    _$AutocompleteRegionsDtoImpl value,
    $Res Function(_$AutocompleteRegionsDtoImpl) then,
  ) = __$$AutocompleteRegionsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RegionDto> results});
}

/// @nodoc
class __$$AutocompleteRegionsDtoImplCopyWithImpl<$Res>
    extends
        _$AutocompleteRegionsDtoCopyWithImpl<$Res, _$AutocompleteRegionsDtoImpl>
    implements _$$AutocompleteRegionsDtoImplCopyWith<$Res> {
  __$$AutocompleteRegionsDtoImplCopyWithImpl(
    _$AutocompleteRegionsDtoImpl _value,
    $Res Function(_$AutocompleteRegionsDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompleteRegionsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null}) {
    return _then(
      _$AutocompleteRegionsDtoImpl(
        results:
            null == results
                ? _value._results
                : results // ignore: cast_nullable_to_non_nullable
                    as List<RegionDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompleteRegionsDtoImpl extends _AutocompleteRegionsDto {
  const _$AutocompleteRegionsDtoImpl({required final List<RegionDto> results})
    : _results = results,
      super._();

  factory _$AutocompleteRegionsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutocompleteRegionsDtoImplFromJson(json);

  final List<RegionDto> _results;
  @override
  List<RegionDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'AutocompleteRegionsDto(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompleteRegionsDtoImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  /// Create a copy of AutocompleteRegionsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompleteRegionsDtoImplCopyWith<_$AutocompleteRegionsDtoImpl>
  get copyWith =>
      __$$AutocompleteRegionsDtoImplCopyWithImpl<_$AutocompleteRegionsDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompleteRegionsDtoImplToJson(this);
  }
}

abstract class _AutocompleteRegionsDto extends AutocompleteRegionsDto {
  const factory _AutocompleteRegionsDto({
    required final List<RegionDto> results,
  }) = _$AutocompleteRegionsDtoImpl;
  const _AutocompleteRegionsDto._() : super._();

  factory _AutocompleteRegionsDto.fromJson(Map<String, dynamic> json) =
      _$AutocompleteRegionsDtoImpl.fromJson;

  @override
  List<RegionDto> get results;

  /// Create a copy of AutocompleteRegionsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutocompleteRegionsDtoImplCopyWith<_$AutocompleteRegionsDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
