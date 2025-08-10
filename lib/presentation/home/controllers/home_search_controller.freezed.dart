// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_search_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AutocompleteSuggestion {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Region region) region,
    required TResult Function(PropertySuggestionItem property) property,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Region region)? region,
    TResult? Function(PropertySuggestionItem property)? property,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Region region)? region,
    TResult Function(PropertySuggestionItem property)? property,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegionSuggestion value) region,
    required TResult Function(PropertySuggestion value) property,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionSuggestion value)? region,
    TResult? Function(PropertySuggestion value)? property,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionSuggestion value)? region,
    TResult Function(PropertySuggestion value)? property,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteSuggestionCopyWith<$Res> {
  factory $AutocompleteSuggestionCopyWith(
    AutocompleteSuggestion value,
    $Res Function(AutocompleteSuggestion) then,
  ) = _$AutocompleteSuggestionCopyWithImpl<$Res, AutocompleteSuggestion>;
}

/// @nodoc
class _$AutocompleteSuggestionCopyWithImpl<
  $Res,
  $Val extends AutocompleteSuggestion
>
    implements $AutocompleteSuggestionCopyWith<$Res> {
  _$AutocompleteSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutocompleteSuggestion
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RegionSuggestionImplCopyWith<$Res> {
  factory _$$RegionSuggestionImplCopyWith(
    _$RegionSuggestionImpl value,
    $Res Function(_$RegionSuggestionImpl) then,
  ) = __$$RegionSuggestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Region region});
}

/// @nodoc
class __$$RegionSuggestionImplCopyWithImpl<$Res>
    extends _$AutocompleteSuggestionCopyWithImpl<$Res, _$RegionSuggestionImpl>
    implements _$$RegionSuggestionImplCopyWith<$Res> {
  __$$RegionSuggestionImplCopyWithImpl(
    _$RegionSuggestionImpl _value,
    $Res Function(_$RegionSuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompleteSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? region = null}) {
    return _then(
      _$RegionSuggestionImpl(
        null == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                as Region,
      ),
    );
  }
}

/// @nodoc

class _$RegionSuggestionImpl implements RegionSuggestion {
  const _$RegionSuggestionImpl(this.region);

  @override
  final Region region;

  @override
  String toString() {
    return 'AutocompleteSuggestion.region(region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionSuggestionImpl &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  /// Create a copy of AutocompleteSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionSuggestionImplCopyWith<_$RegionSuggestionImpl> get copyWith =>
      __$$RegionSuggestionImplCopyWithImpl<_$RegionSuggestionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Region region) region,
    required TResult Function(PropertySuggestionItem property) property,
  }) {
    return region(this.region);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Region region)? region,
    TResult? Function(PropertySuggestionItem property)? property,
  }) {
    return region?.call(this.region);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Region region)? region,
    TResult Function(PropertySuggestionItem property)? property,
    required TResult orElse(),
  }) {
    if (region != null) {
      return region(this.region);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegionSuggestion value) region,
    required TResult Function(PropertySuggestion value) property,
  }) {
    return region(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionSuggestion value)? region,
    TResult? Function(PropertySuggestion value)? property,
  }) {
    return region?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionSuggestion value)? region,
    TResult Function(PropertySuggestion value)? property,
    required TResult orElse(),
  }) {
    if (region != null) {
      return region(this);
    }
    return orElse();
  }
}

abstract class RegionSuggestion implements AutocompleteSuggestion {
  const factory RegionSuggestion(final Region region) = _$RegionSuggestionImpl;

  Region get region;

  /// Create a copy of AutocompleteSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionSuggestionImplCopyWith<_$RegionSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PropertySuggestionImplCopyWith<$Res> {
  factory _$$PropertySuggestionImplCopyWith(
    _$PropertySuggestionImpl value,
    $Res Function(_$PropertySuggestionImpl) then,
  ) = __$$PropertySuggestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PropertySuggestionItem property});
}

/// @nodoc
class __$$PropertySuggestionImplCopyWithImpl<$Res>
    extends _$AutocompleteSuggestionCopyWithImpl<$Res, _$PropertySuggestionImpl>
    implements _$$PropertySuggestionImplCopyWith<$Res> {
  __$$PropertySuggestionImplCopyWithImpl(
    _$PropertySuggestionImpl _value,
    $Res Function(_$PropertySuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompleteSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? property = null}) {
    return _then(
      _$PropertySuggestionImpl(
        null == property
            ? _value.property
            : property // ignore: cast_nullable_to_non_nullable
                as PropertySuggestionItem,
      ),
    );
  }
}

/// @nodoc

class _$PropertySuggestionImpl implements PropertySuggestion {
  const _$PropertySuggestionImpl(this.property);

  @override
  final PropertySuggestionItem property;

  @override
  String toString() {
    return 'AutocompleteSuggestion.property(property: $property)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertySuggestionImpl &&
            (identical(other.property, property) ||
                other.property == property));
  }

  @override
  int get hashCode => Object.hash(runtimeType, property);

  /// Create a copy of AutocompleteSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertySuggestionImplCopyWith<_$PropertySuggestionImpl> get copyWith =>
      __$$PropertySuggestionImplCopyWithImpl<_$PropertySuggestionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Region region) region,
    required TResult Function(PropertySuggestionItem property) property,
  }) {
    return property(this.property);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Region region)? region,
    TResult? Function(PropertySuggestionItem property)? property,
  }) {
    return property?.call(this.property);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Region region)? region,
    TResult Function(PropertySuggestionItem property)? property,
    required TResult orElse(),
  }) {
    if (property != null) {
      return property(this.property);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegionSuggestion value) region,
    required TResult Function(PropertySuggestion value) property,
  }) {
    return property(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegionSuggestion value)? region,
    TResult? Function(PropertySuggestion value)? property,
  }) {
    return property?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegionSuggestion value)? region,
    TResult Function(PropertySuggestion value)? property,
    required TResult orElse(),
  }) {
    if (property != null) {
      return property(this);
    }
    return orElse();
  }
}

abstract class PropertySuggestion implements AutocompleteSuggestion {
  const factory PropertySuggestion(final PropertySuggestionItem property) =
      _$PropertySuggestionImpl;

  PropertySuggestionItem get property;

  /// Create a copy of AutocompleteSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertySuggestionImplCopyWith<_$PropertySuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeSearchState {
  String get locationText => throw _privateConstructorUsedError;
  DateTimeRange<DateTime>? get stayRange => throw _privateConstructorUsedError;
  int get adults => throw _privateConstructorUsedError;
  int get children => throw _privateConstructorUsedError;
  bool get isAutocompleteOpen => throw _privateConstructorUsedError;
  List<AutocompleteSuggestion> get suggestions =>
      throw _privateConstructorUsedError;

  /// Create a copy of HomeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeSearchStateCopyWith<HomeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSearchStateCopyWith<$Res> {
  factory $HomeSearchStateCopyWith(
    HomeSearchState value,
    $Res Function(HomeSearchState) then,
  ) = _$HomeSearchStateCopyWithImpl<$Res, HomeSearchState>;
  @useResult
  $Res call({
    String locationText,
    DateTimeRange<DateTime>? stayRange,
    int adults,
    int children,
    bool isAutocompleteOpen,
    List<AutocompleteSuggestion> suggestions,
  });
}

/// @nodoc
class _$HomeSearchStateCopyWithImpl<$Res, $Val extends HomeSearchState>
    implements $HomeSearchStateCopyWith<$Res> {
  _$HomeSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationText = null,
    Object? stayRange = freezed,
    Object? adults = null,
    Object? children = null,
    Object? isAutocompleteOpen = null,
    Object? suggestions = null,
  }) {
    return _then(
      _value.copyWith(
            locationText:
                null == locationText
                    ? _value.locationText
                    : locationText // ignore: cast_nullable_to_non_nullable
                        as String,
            stayRange:
                freezed == stayRange
                    ? _value.stayRange
                    : stayRange // ignore: cast_nullable_to_non_nullable
                        as DateTimeRange<DateTime>?,
            adults:
                null == adults
                    ? _value.adults
                    : adults // ignore: cast_nullable_to_non_nullable
                        as int,
            children:
                null == children
                    ? _value.children
                    : children // ignore: cast_nullable_to_non_nullable
                        as int,
            isAutocompleteOpen:
                null == isAutocompleteOpen
                    ? _value.isAutocompleteOpen
                    : isAutocompleteOpen // ignore: cast_nullable_to_non_nullable
                        as bool,
            suggestions:
                null == suggestions
                    ? _value.suggestions
                    : suggestions // ignore: cast_nullable_to_non_nullable
                        as List<AutocompleteSuggestion>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeSearchStateImplCopyWith<$Res>
    implements $HomeSearchStateCopyWith<$Res> {
  factory _$$HomeSearchStateImplCopyWith(
    _$HomeSearchStateImpl value,
    $Res Function(_$HomeSearchStateImpl) then,
  ) = __$$HomeSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String locationText,
    DateTimeRange<DateTime>? stayRange,
    int adults,
    int children,
    bool isAutocompleteOpen,
    List<AutocompleteSuggestion> suggestions,
  });
}

/// @nodoc
class __$$HomeSearchStateImplCopyWithImpl<$Res>
    extends _$HomeSearchStateCopyWithImpl<$Res, _$HomeSearchStateImpl>
    implements _$$HomeSearchStateImplCopyWith<$Res> {
  __$$HomeSearchStateImplCopyWithImpl(
    _$HomeSearchStateImpl _value,
    $Res Function(_$HomeSearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationText = null,
    Object? stayRange = freezed,
    Object? adults = null,
    Object? children = null,
    Object? isAutocompleteOpen = null,
    Object? suggestions = null,
  }) {
    return _then(
      _$HomeSearchStateImpl(
        locationText:
            null == locationText
                ? _value.locationText
                : locationText // ignore: cast_nullable_to_non_nullable
                    as String,
        stayRange:
            freezed == stayRange
                ? _value.stayRange
                : stayRange // ignore: cast_nullable_to_non_nullable
                    as DateTimeRange<DateTime>?,
        adults:
            null == adults
                ? _value.adults
                : adults // ignore: cast_nullable_to_non_nullable
                    as int,
        children:
            null == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                    as int,
        isAutocompleteOpen:
            null == isAutocompleteOpen
                ? _value.isAutocompleteOpen
                : isAutocompleteOpen // ignore: cast_nullable_to_non_nullable
                    as bool,
        suggestions:
            null == suggestions
                ? _value._suggestions
                : suggestions // ignore: cast_nullable_to_non_nullable
                    as List<AutocompleteSuggestion>,
      ),
    );
  }
}

/// @nodoc

class _$HomeSearchStateImpl implements _HomeSearchState {
  const _$HomeSearchStateImpl({
    this.locationText = '',
    this.stayRange,
    this.adults = 2,
    this.children = 0,
    this.isAutocompleteOpen = false,
    final List<AutocompleteSuggestion> suggestions = const [],
  }) : _suggestions = suggestions;

  @override
  @JsonKey()
  final String locationText;
  @override
  final DateTimeRange<DateTime>? stayRange;
  @override
  @JsonKey()
  final int adults;
  @override
  @JsonKey()
  final int children;
  @override
  @JsonKey()
  final bool isAutocompleteOpen;
  final List<AutocompleteSuggestion> _suggestions;
  @override
  @JsonKey()
  List<AutocompleteSuggestion> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  String toString() {
    return 'HomeSearchState(locationText: $locationText, stayRange: $stayRange, adults: $adults, children: $children, isAutocompleteOpen: $isAutocompleteOpen, suggestions: $suggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSearchStateImpl &&
            (identical(other.locationText, locationText) ||
                other.locationText == locationText) &&
            (identical(other.stayRange, stayRange) ||
                other.stayRange == stayRange) &&
            (identical(other.adults, adults) || other.adults == adults) &&
            (identical(other.children, children) ||
                other.children == children) &&
            (identical(other.isAutocompleteOpen, isAutocompleteOpen) ||
                other.isAutocompleteOpen == isAutocompleteOpen) &&
            const DeepCollectionEquality().equals(
              other._suggestions,
              _suggestions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    locationText,
    stayRange,
    adults,
    children,
    isAutocompleteOpen,
    const DeepCollectionEquality().hash(_suggestions),
  );

  /// Create a copy of HomeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSearchStateImplCopyWith<_$HomeSearchStateImpl> get copyWith =>
      __$$HomeSearchStateImplCopyWithImpl<_$HomeSearchStateImpl>(
        this,
        _$identity,
      );
}

abstract class _HomeSearchState implements HomeSearchState {
  const factory _HomeSearchState({
    final String locationText,
    final DateTimeRange<DateTime>? stayRange,
    final int adults,
    final int children,
    final bool isAutocompleteOpen,
    final List<AutocompleteSuggestion> suggestions,
  }) = _$HomeSearchStateImpl;

  @override
  String get locationText;
  @override
  DateTimeRange<DateTime>? get stayRange;
  @override
  int get adults;
  @override
  int get children;
  @override
  bool get isAutocompleteOpen;
  @override
  List<AutocompleteSuggestion> get suggestions;

  /// Create a copy of HomeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeSearchStateImplCopyWith<_$HomeSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
