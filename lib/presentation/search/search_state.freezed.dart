// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchState {
  List<SearchProperty> get items => throw _privateConstructorUsedError;
  int? get nextOffset =>
      throw _privateConstructorUsedError; // from response.nextPropertyOffset
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get errorMessage =>
      throw _privateConstructorUsedError; // Keep the last successful query params (excluding offset) so we can call loadMore()
  String get regionId => throw _privateConstructorUsedError;
  String get checkInDate => throw _privateConstructorUsedError;
  String get checkOutDate => throw _privateConstructorUsedError;
  int get numberOfRooms => throw _privateConstructorUsedError;
  int get numberOfAdults => throw _privateConstructorUsedError;
  int get numberOfChildren => throw _privateConstructorUsedError;
  String get residency => throw _privateConstructorUsedError;
  List<int>? get starRatings => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) then,
  ) = _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({
    List<SearchProperty> items,
    int? nextOffset,
    bool isLoading,
    bool isLoadingMore,
    String? errorMessage,
    String regionId,
    String checkInDate,
    String checkOutDate,
    int numberOfRooms,
    int numberOfAdults,
    int numberOfChildren,
    String residency,
    List<int>? starRatings,
    String currency,
  });
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextOffset = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
    Object? regionId = null,
    Object? checkInDate = null,
    Object? checkOutDate = null,
    Object? numberOfRooms = null,
    Object? numberOfAdults = null,
    Object? numberOfChildren = null,
    Object? residency = null,
    Object? starRatings = freezed,
    Object? currency = null,
  }) {
    return _then(
      _value.copyWith(
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<SearchProperty>,
            nextOffset:
                freezed == nextOffset
                    ? _value.nextOffset
                    : nextOffset // ignore: cast_nullable_to_non_nullable
                        as int?,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoadingMore:
                null == isLoadingMore
                    ? _value.isLoadingMore
                    : isLoadingMore // ignore: cast_nullable_to_non_nullable
                        as bool,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            regionId:
                null == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as String,
            checkInDate:
                null == checkInDate
                    ? _value.checkInDate
                    : checkInDate // ignore: cast_nullable_to_non_nullable
                        as String,
            checkOutDate:
                null == checkOutDate
                    ? _value.checkOutDate
                    : checkOutDate // ignore: cast_nullable_to_non_nullable
                        as String,
            numberOfRooms:
                null == numberOfRooms
                    ? _value.numberOfRooms
                    : numberOfRooms // ignore: cast_nullable_to_non_nullable
                        as int,
            numberOfAdults:
                null == numberOfAdults
                    ? _value.numberOfAdults
                    : numberOfAdults // ignore: cast_nullable_to_non_nullable
                        as int,
            numberOfChildren:
                null == numberOfChildren
                    ? _value.numberOfChildren
                    : numberOfChildren // ignore: cast_nullable_to_non_nullable
                        as int,
            residency:
                null == residency
                    ? _value.residency
                    : residency // ignore: cast_nullable_to_non_nullable
                        as String,
            starRatings:
                freezed == starRatings
                    ? _value.starRatings
                    : starRatings // ignore: cast_nullable_to_non_nullable
                        as List<int>?,
            currency:
                null == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
    _$SearchStateImpl value,
    $Res Function(_$SearchStateImpl) then,
  ) = __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<SearchProperty> items,
    int? nextOffset,
    bool isLoading,
    bool isLoadingMore,
    String? errorMessage,
    String regionId,
    String checkInDate,
    String checkOutDate,
    int numberOfRooms,
    int numberOfAdults,
    int numberOfChildren,
    String residency,
    List<int>? starRatings,
    String currency,
  });
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
    _$SearchStateImpl _value,
    $Res Function(_$SearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextOffset = freezed,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? errorMessage = freezed,
    Object? regionId = null,
    Object? checkInDate = null,
    Object? checkOutDate = null,
    Object? numberOfRooms = null,
    Object? numberOfAdults = null,
    Object? numberOfChildren = null,
    Object? residency = null,
    Object? starRatings = freezed,
    Object? currency = null,
  }) {
    return _then(
      _$SearchStateImpl(
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<SearchProperty>,
        nextOffset:
            freezed == nextOffset
                ? _value.nextOffset
                : nextOffset // ignore: cast_nullable_to_non_nullable
                    as int?,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoadingMore:
            null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                    as bool,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        regionId:
            null == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as String,
        checkInDate:
            null == checkInDate
                ? _value.checkInDate
                : checkInDate // ignore: cast_nullable_to_non_nullable
                    as String,
        checkOutDate:
            null == checkOutDate
                ? _value.checkOutDate
                : checkOutDate // ignore: cast_nullable_to_non_nullable
                    as String,
        numberOfRooms:
            null == numberOfRooms
                ? _value.numberOfRooms
                : numberOfRooms // ignore: cast_nullable_to_non_nullable
                    as int,
        numberOfAdults:
            null == numberOfAdults
                ? _value.numberOfAdults
                : numberOfAdults // ignore: cast_nullable_to_non_nullable
                    as int,
        numberOfChildren:
            null == numberOfChildren
                ? _value.numberOfChildren
                : numberOfChildren // ignore: cast_nullable_to_non_nullable
                    as int,
        residency:
            null == residency
                ? _value.residency
                : residency // ignore: cast_nullable_to_non_nullable
                    as String,
        starRatings:
            freezed == starRatings
                ? _value._starRatings
                : starRatings // ignore: cast_nullable_to_non_nullable
                    as List<int>?,
        currency:
            null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl({
    final List<SearchProperty> items = const <SearchProperty>[],
    this.nextOffset,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.errorMessage,
    required this.regionId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfRooms,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.residency,
    final List<int>? starRatings,
    required this.currency,
  }) : _items = items,
       _starRatings = starRatings;

  final List<SearchProperty> _items;
  @override
  @JsonKey()
  List<SearchProperty> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? nextOffset;
  // from response.nextPropertyOffset
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? errorMessage;
  // Keep the last successful query params (excluding offset) so we can call loadMore()
  @override
  final String regionId;
  @override
  final String checkInDate;
  @override
  final String checkOutDate;
  @override
  final int numberOfRooms;
  @override
  final int numberOfAdults;
  @override
  final int numberOfChildren;
  @override
  final String residency;
  final List<int>? _starRatings;
  @override
  List<int>? get starRatings {
    final value = _starRatings;
    if (value == null) return null;
    if (_starRatings is EqualUnmodifiableListView) return _starRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String currency;

  @override
  String toString() {
    return 'SearchState(items: $items, nextOffset: $nextOffset, isLoading: $isLoading, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, regionId: $regionId, checkInDate: $checkInDate, checkOutDate: $checkOutDate, numberOfRooms: $numberOfRooms, numberOfAdults: $numberOfAdults, numberOfChildren: $numberOfChildren, residency: $residency, starRatings: $starRatings, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextOffset, nextOffset) ||
                other.nextOffset == nextOffset) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.numberOfRooms, numberOfRooms) ||
                other.numberOfRooms == numberOfRooms) &&
            (identical(other.numberOfAdults, numberOfAdults) ||
                other.numberOfAdults == numberOfAdults) &&
            (identical(other.numberOfChildren, numberOfChildren) ||
                other.numberOfChildren == numberOfChildren) &&
            (identical(other.residency, residency) ||
                other.residency == residency) &&
            const DeepCollectionEquality().equals(
              other._starRatings,
              _starRatings,
            ) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    nextOffset,
    isLoading,
    isLoadingMore,
    errorMessage,
    regionId,
    checkInDate,
    checkOutDate,
    numberOfRooms,
    numberOfAdults,
    numberOfChildren,
    residency,
    const DeepCollectionEquality().hash(_starRatings),
    currency,
  );

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState({
    final List<SearchProperty> items,
    final int? nextOffset,
    final bool isLoading,
    final bool isLoadingMore,
    final String? errorMessage,
    required final String regionId,
    required final String checkInDate,
    required final String checkOutDate,
    required final int numberOfRooms,
    required final int numberOfAdults,
    required final int numberOfChildren,
    required final String residency,
    final List<int>? starRatings,
    required final String currency,
  }) = _$SearchStateImpl;

  @override
  List<SearchProperty> get items;
  @override
  int? get nextOffset; // from response.nextPropertyOffset
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  String? get errorMessage; // Keep the last successful query params (excluding offset) so we can call loadMore()
  @override
  String get regionId;
  @override
  String get checkInDate;
  @override
  String get checkOutDate;
  @override
  int get numberOfRooms;
  @override
  int get numberOfAdults;
  @override
  int get numberOfChildren;
  @override
  String get residency;
  @override
  List<int>? get starRatings;
  @override
  String get currency;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
