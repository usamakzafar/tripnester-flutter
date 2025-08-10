// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete_property_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AutocompletePropertyResultDto _$AutocompletePropertyResultDtoFromJson(
  Map<String, dynamic> json,
) {
  return _AutocompletePropertyResultDto.fromJson(json);
}

/// @nodoc
mixin _$AutocompletePropertyResultDto {
  List<PropertySuggestionItemDto> get results =>
      throw _privateConstructorUsedError;

  /// Serializes this AutocompletePropertyResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutocompletePropertyResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutocompletePropertyResultDtoCopyWith<AutocompletePropertyResultDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompletePropertyResultDtoCopyWith<$Res> {
  factory $AutocompletePropertyResultDtoCopyWith(
    AutocompletePropertyResultDto value,
    $Res Function(AutocompletePropertyResultDto) then,
  ) =
      _$AutocompletePropertyResultDtoCopyWithImpl<
        $Res,
        AutocompletePropertyResultDto
      >;
  @useResult
  $Res call({List<PropertySuggestionItemDto> results});
}

/// @nodoc
class _$AutocompletePropertyResultDtoCopyWithImpl<
  $Res,
  $Val extends AutocompletePropertyResultDto
>
    implements $AutocompletePropertyResultDtoCopyWith<$Res> {
  _$AutocompletePropertyResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutocompletePropertyResultDto
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
                        as List<PropertySuggestionItemDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AutocompletePropertyResultDtoImplCopyWith<$Res>
    implements $AutocompletePropertyResultDtoCopyWith<$Res> {
  factory _$$AutocompletePropertyResultDtoImplCopyWith(
    _$AutocompletePropertyResultDtoImpl value,
    $Res Function(_$AutocompletePropertyResultDtoImpl) then,
  ) = __$$AutocompletePropertyResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PropertySuggestionItemDto> results});
}

/// @nodoc
class __$$AutocompletePropertyResultDtoImplCopyWithImpl<$Res>
    extends
        _$AutocompletePropertyResultDtoCopyWithImpl<
          $Res,
          _$AutocompletePropertyResultDtoImpl
        >
    implements _$$AutocompletePropertyResultDtoImplCopyWith<$Res> {
  __$$AutocompletePropertyResultDtoImplCopyWithImpl(
    _$AutocompletePropertyResultDtoImpl _value,
    $Res Function(_$AutocompletePropertyResultDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompletePropertyResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? results = null}) {
    return _then(
      _$AutocompletePropertyResultDtoImpl(
        results:
            null == results
                ? _value._results
                : results // ignore: cast_nullable_to_non_nullable
                    as List<PropertySuggestionItemDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompletePropertyResultDtoImpl
    extends _AutocompletePropertyResultDto {
  const _$AutocompletePropertyResultDtoImpl({
    required final List<PropertySuggestionItemDto> results,
  }) : _results = results,
       super._();

  factory _$AutocompletePropertyResultDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AutocompletePropertyResultDtoImplFromJson(json);

  final List<PropertySuggestionItemDto> _results;
  @override
  List<PropertySuggestionItemDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'AutocompletePropertyResultDto(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompletePropertyResultDtoImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  /// Create a copy of AutocompletePropertyResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompletePropertyResultDtoImplCopyWith<
    _$AutocompletePropertyResultDtoImpl
  >
  get copyWith => __$$AutocompletePropertyResultDtoImplCopyWithImpl<
    _$AutocompletePropertyResultDtoImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompletePropertyResultDtoImplToJson(this);
  }
}

abstract class _AutocompletePropertyResultDto
    extends AutocompletePropertyResultDto {
  const factory _AutocompletePropertyResultDto({
    required final List<PropertySuggestionItemDto> results,
  }) = _$AutocompletePropertyResultDtoImpl;
  const _AutocompletePropertyResultDto._() : super._();

  factory _AutocompletePropertyResultDto.fromJson(Map<String, dynamic> json) =
      _$AutocompletePropertyResultDtoImpl.fromJson;

  @override
  List<PropertySuggestionItemDto> get results;

  /// Create a copy of AutocompletePropertyResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutocompletePropertyResultDtoImplCopyWith<
    _$AutocompletePropertyResultDtoImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
