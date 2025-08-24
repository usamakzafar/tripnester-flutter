import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../listings/listing_search_args.dart';
import '../search/widgets/hotel_item_card.dart';
import '../search/widgets/search_bar_widget.dart';
import 'controllers/listings_controller.dart';
import 'mappers/property_to_hotel_item.dart';

class PropertyListingsScreen extends ConsumerStatefulWidget {
  const PropertyListingsScreen({
    super.key,
    required this.regionId,
    this.propertyId,
    this.args,
  });

  final String regionId;
  final String? propertyId;
  final ListingSearchArgs? args;

  @override
  ConsumerState<PropertyListingsScreen> createState() =>
      _PropertyListingsScreenState();
}

class _PropertyListingsScreenState
    extends ConsumerState<PropertyListingsScreen> {
  final _scrollController = ScrollController();
  final ValueChanged<String>? onChanged = (a) {};
  final FocusNode? focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _triggerInitialLoad();
    });
    _scrollController.addListener(_onScroll);
  }

  void _triggerInitialLoad() {
    final args = widget.args;
    final now = DateTime.now();
    final checkIn = args?.stayRange.start ?? now.add(const Duration(days: 1));
    final checkOut = args?.stayRange.end ?? now.add(const Duration(days: 2));
    final rooms = args?.rooms ?? 1;
    final adults = args?.adults ?? 2;
    final children = args?.children ?? 0;
    final childrenAges = args?.childrenAges;

    ref
        .read(listingsControllerProvider.notifier)
        .loadInitial(
          regionId: widget.regionId,
          checkIn: checkIn,
          checkOut: checkOut,
          rooms: rooms,
          adults: adults,
          children: children,
          childrenAges: childrenAges,
        );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final listings =
        ref.read(listingsControllerProvider).value ?? const ListingsState();
    if (listings.isLoadingMore || listings.nextOffset == null) return;

    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 400) {
      ref.read(listingsControllerProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final asyncState = ref.watch(listingsControllerProvider);
    final state = asyncState.value ?? const ListingsState();

    final items = state.items.map(mapProperty).toList();

    return Scaffold(
      backgroundColor: scheme.onPrimary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: scheme.onSecondary),
        backgroundColor: scheme.onPrimary,
        surfaceTintColor: scheme.onPrimary,
        elevation: 4,
        scrolledUnderElevation: 6,
        title: SearchBarWidget(
          onChanged: (a) {},
          focusNode: FocusNode(),
          initialValue: widget.args?.locationName ?? '', // Pass the focus node
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(48), // height of filters row
          child: _FiltersRow(),
        ),
        actions: [const SizedBox(width: 48)], // Placeholder for alignment
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content
          Expanded(
            child: Builder(
              builder: (_) {
                if (state.isLoading) {
                  return Center(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(color: scheme.primary),
                    ),
                  );
                }

                if (state.error != null && state.items.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Could not load listings. Please try again.',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          FilledButton(
                            onPressed: _triggerInitialLoad,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (items.isEmpty) {
                  return Center(
                    child: Text(
                      'No properties found',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: items.length + (state.isLoadingMore ? 1 : 0) + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.place_outlined,
                              size: 18,
                              color: scheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Showing ${items.length} results for ${widget.args?.locationName ?? widget.regionId}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    }

                    if (index >= items.length + 1) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: scheme.primary,
                            ),
                          ),
                        ),
                      );
                    }

                    final hotel = items[index - 1];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: HotelItemCard(
                        hotel: hotel,
                        checkInDate: widget.args?.stayRange.start,
                        checkOutDate: widget.args?.stayRange.end,
                        numberOfRooms: widget.args?.rooms,
                        numberOfAdults: widget.args?.adults,
                        numberOfChildren: widget.args?.children,
                        children: widget.args?.childrenAges,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FiltersRow extends ConsumerWidget {
  const _FiltersRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final asyncState = ref.watch(listingsControllerProvider);
    final s = asyncState.value ?? const ListingsState();
    final f = s.filters;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      physics: const BouncingScrollPhysics(),
      child: Row(
        spacing: 8,
        children: [
          // Free cancellation
          FilterChip(
            label: Text('Free cancellation', style: theme.textTheme.bodySmall),
            selected: f.freeCancel,
            onSelected:
                (v) => ref
                    .read(listingsControllerProvider.notifier)
                    .updateFilters(freeCancel: v),
            selectedColor: scheme.primary.withValues(alpha: 0.12),
            side: BorderSide(color: scheme.outlineVariant),
          ),
          // Deals
          FilterChip(
            label: Text('Deals', style: theme.textTheme.bodySmall),
            selected: f.hasDeal,
            onSelected:
                (v) => ref
                    .read(listingsControllerProvider.notifier)
                    .updateFilters(hasDeal: v),
            selectedColor: scheme.primary.withValues(alpha: 0.12),
            side: BorderSide(color: scheme.outlineVariant),
          ),
          // Sort: Recommended
          ChoiceChip(
            label: Text('Recommended', style: theme.textTheme.bodySmall),
            selected: s.sort == SortOrder.recommended,
            onSelected:
                (_) => ref
                    .read(listingsControllerProvider.notifier)
                    .updateSort(SortOrder.recommended),
            selectedColor: scheme.primary.withValues(alpha: 0.12),
            side: BorderSide(color: scheme.outlineVariant),
          ),
          // Sort: Price
          ChoiceChip(
            label: Text('Price', style: theme.textTheme.bodySmall),
            selected: s.sort == SortOrder.price,
            onSelected:
                (_) => ref
                    .read(listingsControllerProvider.notifier)
                    .updateSort(SortOrder.price),
            selectedColor: scheme.primary.withValues(alpha: 0.12),
            side: BorderSide(color: scheme.outlineVariant),
          ),
          // Sort: Rating
          ChoiceChip(
            label: Text('Rating', style: theme.textTheme.bodySmall),
            selected: s.sort == SortOrder.rating,
            onSelected:
                (_) => ref
                    .read(listingsControllerProvider.notifier)
                    .updateSort(SortOrder.rating),
            selectedColor: scheme.primary.withValues(alpha: 0.12),
            side: BorderSide(color: scheme.outlineVariant),
          ),
        ],
      ),
    );
  }
}
