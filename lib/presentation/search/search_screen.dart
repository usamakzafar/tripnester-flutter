import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../autocomplete/autocomplete_providers.dart';
import 'widgets/search_header.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/static_search_widgets.dart';
import '../ui_kit/destination_picker_field.dart';
import '../../domain/entities/autocomplete_result.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String _currentQuery = '';
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Auto-focus the search field when the screen appears
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    setState(() => _currentQuery = value);
    final q = value.trim();

    final notifier = ref.read(autocompleteControllerProvider.notifier);

    // Always forward to controller (it handles its own debounce/clearing)
    final now = DateTime.now();
    final checkIn = now.add(const Duration(days: 1));
    final checkOut = now.add(const Duration(days: 2));
    notifier.fetchSuggestions(
      query: q,
      checkIn: checkIn,
      checkOut: checkOut,
      rooms: 1,
      adults: 2,
      children: 0,
      residency: 'US',
      debounce: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final asyncAuto = ref.watch(autocompleteControllerProvider);

    return Scaffold(
      backgroundColor: colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SearchHeader(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Search bar with filter
                    SearchBarWidget(
                      onChanged: _onQueryChanged,
                      focusNode: _searchFocusNode, // Pass the focus node
                  ),

                    // Content below depends on query length and provider state
                    const SizedBox(height: 16),
                    _buildBodyForState(context, asyncAuto),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyForState(BuildContext context, AsyncValue<AutocompleteResult?> asyncAuto) {
    final q = _currentQuery.trim();
    if (q.length < 3) {
      return const StaticSearchWidgets();
    }

    // When query >= 3, show provider-driven states
    return asyncAuto.when(
      loading: () => _LoadingIndicator(),
      error: (e, _) => _ErrorCard(message: 'We could not load suggestions. Please try again.'),
      data: (result) {
        final regions = result?.regions.results ?? const [];
        final props = result?.properties.results ?? const [];
        final total = regions.length + props.length;
        if (total == 0) {
          return _EmptyMessage(text: 'No matches yet');
        }

        final theme = Theme.of(context);
        final scheme = theme.colorScheme;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // parent scroll handles physics
          itemCount: total,
          itemBuilder: (ctx, index) {
            final isRegion = index < regions.length;
            final title = isRegion ? regions[index].name : props[index - regions.length].name;
            final subtitle = isRegion
                ? regions[index].countryName
                : props[index - regions.length].regionName;
            final iconPath = isRegion
                ? Icons.place
                : Icons.hotel;

            return ListTile(
              leading: Icon(iconPath, color: scheme.primary, size: 24),
              title: Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(color: scheme.onSurface),
              ),
              subtitle: Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.72),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop(SelectedDestination(title));
              },
            );
          },
        );
      },
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Center(child: SizedBox(height: 32, width: 32, child: CircularProgressIndicator(color: color))),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final String message;
  const _ErrorCard({required this.message});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: scheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: scheme.error.withValues(alpha: 0.24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.error_outline, color: scheme.error),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: scheme.onErrorContainer),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyMessage extends StatelessWidget {
  final String text;
  const _EmptyMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: onSurface),
        ),
      ),
    );
  }
}
