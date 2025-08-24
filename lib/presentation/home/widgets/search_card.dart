import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/home_search_controller.dart';
import '../../ui_kit/destination_picker_field.dart';
import '../../listings/listing_search_args.dart';

class SearchCard extends ConsumerStatefulWidget {
  const SearchCard({super.key});

  @override
  ConsumerState<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends ConsumerState<SearchCard> {
  final _locationController = TextEditingController();
  SelectedDestination? _selectedDestination;

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final searchState = ref.watch(homeSearchControllerProvider);
    final state = searchState.valueOrNull ?? const HomeSearchState();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Let\'s find your perfect hotel',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),

        // Destination Picker Field (read-only, opens SearchScreen)
        DestinationPickerField(
          controller: _locationController,
          label: 'Destination',
          hint: 'Search destinations, hotels...',
          onSelected: (sel) {
            setState(() => _selectedDestination = sel);
            // Optionally sync with controller state without triggering autocomplete
            ref.read(homeSearchControllerProvider.notifier).setLocationTextWithoutAutocomplete(sel.name);
          },
        ),
        const SizedBox(height: 16),

        // Date Range Field
        InkWell(
          onTap: _selectDateRange,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
              color: colorScheme.surface.withValues(alpha: 0.85),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _formatDateRange(state.stayRange),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: state.stayRange != null
                        ? colorScheme.onSurface
                        : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Guests Field
        InkWell(
          onTap: _selectGuests,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
              color: colorScheme.surface.withValues(alpha: 0.85),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.people,
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _formatGuests(state.adults, state.children),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Search Button
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () {
              _onSubmit(context, state);
            },
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            label: Text(
              'Search Hotels',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSubmit(BuildContext context, HomeSearchState state) {
    final dest = _selectedDestination;
    final range = state.stayRange;

    if (dest == null || (dest.regionId == null || dest.regionId!.isEmpty)) {
      _showSnack(context, 'Please pick a destination');
      return;
    }
    if (range == null) {
      _showSnack(context, 'Please select your stay dates');
      return;
    }

    // Validate children ages if needed
    if (state.children > 0) {
      final ages = state.childrenAges;
      final hasMissing = ages.length < state.children || ages.take(state.children).any((a) => a < 0);
      if (hasMissing) {
        _showSnack(context, 'Please select all children ages');
        return;
      }
    }

    final childrenAges = state.children > 0
        ? state.childrenAges.take(state.children).toList()
        : null;

    final args = ListingSearchArgs(
      regionId: dest.regionId!,
      propertyId: dest.propertyId,
      locationName: dest.name,
      stayRange: range,
      rooms: 1,
      adults: state.adults,
      children: state.children,
      residency: 'US',
      currency: 'USD',
      childrenAges: childrenAges,
    );

    context.push('/listings', extra: args);
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  Future<void> _selectDateRange() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'Select your stay dates',
      saveText: 'Apply',
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx),
        child: child!,
      ),
    );

    if (range != null) {
      ref.read(homeSearchControllerProvider.notifier).setDateRange(range);
    }
  }

  Future<void> _selectGuests() async {
    final state = ref.read(homeSearchControllerProvider).valueOrNull ?? const HomeSearchState();

    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => _GuestSelector(
        initialAdults: state.adults,
        initialChildren: state.children,
        initialChildrenAges: state.children > 0
            ? state.childrenAges.take(state.children).toList()
            : const [],
        onChanged: (adults, children) {
          ref.read(homeSearchControllerProvider.notifier).setAdults(adults);
          ref.read(homeSearchControllerProvider.notifier).setChildren(children);
        },
        onAgesSelected: (ages) {
          ref.read(homeSearchControllerProvider.notifier).setChildrenAges(ages);
        },
      ),
    );
  }

  String _formatDateRange(DateTimeRange? range) {
    if (range == null) {
      return 'Check-in – Check-out';
    }

    final checkIn = '${range.start.day}/${range.start.month}';
    final checkOut = '${range.end.day}/${range.end.month}';
    return '$checkIn – $checkOut';
  }

  String _formatGuests(int adults, int children) {
    final guestText = StringBuffer();
    guestText.write('$adults adult${adults == 1 ? '' : 's'}');

    if (children > 0) {
      guestText.write(', $children child${children == 1 ? '' : 'ren'}');
    }

    return guestText.toString();
  }
}

class _GuestSelector extends StatefulWidget {
  final int initialAdults;
  final int initialChildren;
  final Function(int adults, int children) onChanged;
  final List<int>? initialChildrenAges;
  final void Function(List<int> ages)? onAgesSelected;

  const _GuestSelector({
    required this.initialAdults,
    required this.initialChildren,
    required this.onChanged,
    this.initialChildrenAges,
    this.onAgesSelected,
  });

  @override
  State<_GuestSelector> createState() => _GuestSelectorState();
}

class _GuestSelectorState extends State<_GuestSelector> {
  late int adults;
  late int children;
  late List<int?> _childrenAges; // null = not selected yet; 0..17 values

  @override
  void initState() {
    super.initState();
    adults = widget.initialAdults;
    children = widget.initialChildren;
    final init = widget.initialChildrenAges ?? const [];
    _childrenAges = List<int?>.from(init.map((e) => e >= 0 ? e : null));
    // ensure length matches children
    if (_childrenAges.length < children) {
      _childrenAges.addAll(List<int?>.filled(children - _childrenAges.length, null));
    } else if (_childrenAges.length > children) {
      _childrenAges.removeRange(children, _childrenAges.length);
    }
  }

  void _syncAgesLength() {
    if (_childrenAges.length < children) {
      _childrenAges.addAll(List<int?>.filled(children - _childrenAges.length, null));
    } else if (_childrenAges.length > children) {
      _childrenAges.removeRange(children, _childrenAges.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guests',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            // Adults
            _buildGuestRow(
              'Adults',
              adults,
              () => setState(() {
                if (adults > 1) {
                  adults--;
                  widget.onChanged(adults, children);
                }
              }),
              () => setState(() {
                adults++;
                widget.onChanged(adults, children);
              }),
            ),
            const SizedBox(height: 16),

            // Children
            _buildGuestRow(
              'Children',
              children,
              () => setState(() {
                if (children > 0) {
                  children--;
                  _syncAgesLength();
                  widget.onChanged(adults, children);
                }
              }),
              () => setState(() {
                children++;
                _syncAgesLength();
                widget.onChanged(adults, children);
              }),
            ),

            if (children > 0) ...[
              const SizedBox(height: 16),
              Text(
                'Children ages',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              _ChildrenAgesList(
                count: children,
                initialAges: _childrenAges,
                onChanged: (index, age) {
                  setState(() {
                    _childrenAges[index] = age;
                  });
                },
              ),
            ],

            const SizedBox(height: 24),

            // Done Button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  // Validate children ages if any children
                  if (children > 0) {
                    final missing = _childrenAges.take(children).any((e) => e == null);
                    if (missing) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select all children ages')),
                      );
                      return;
                    }
                  }
                  // Emit ages if requested
                  if (widget.onAgesSelected != null) {
                    widget.onAgesSelected!(_childrenAges.take(children).map((e) => e ?? 0).toList());
                  }
                  Navigator.of(context).pop();
                },
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestRow(String label, int count, VoidCallback onDecrease, VoidCallback onIncrease) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyLarge,
        ),
        Row(
          children: [
            IconButton(
              onPressed: (label == 'Adults' && count <= 1) || (label == 'Children' && count <= 0)
                ? null
                : onDecrease,
              icon: const Icon(Icons.remove_circle_outline),
              color: colorScheme.primary,
            ),
            Container(
              width: 40,
              alignment: Alignment.center,
              child: Text(
                count.toString(),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              onPressed: onIncrease,
              icon: const Icon(Icons.add_circle_outline),
              color: colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }
}

class _ChildrenAgesList extends StatelessWidget {
  final int count;
  final List<int?> initialAges;
  final void Function(int index, int age) onChanged;

  const _ChildrenAgesList({
    required this.count,
    required this.initialAges,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = List<DropdownMenuItem<int>>.generate(
      18,
      (i) => DropdownMenuItem<int>(
        value: i,
        child: Text(
          i == 0 ? '<1 year old' : (i == 1 ? '1 year' : '$i years'),
          style: theme.textTheme.bodyMedium,
        ),
      ),
    );

    return Column(
      children: List.generate(count, (index) {
        final value = index < initialAges.length ? initialAges[index] : null;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: DropdownButtonFormField<int>(
            value: value,
            items: items,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Child age',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
            onChanged: (v) {
              if (v != null) onChanged(index, v);
            },
          ),
        );
      }),
    );
  }
}
