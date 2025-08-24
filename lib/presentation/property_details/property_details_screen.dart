import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search/widgets/hotel_item_card.dart';
import 'widgets/property_header.dart';
import 'widgets/common_facilities.dart';
import 'widgets/property_description.dart';
import 'widgets/location_section.dart';
import 'widgets/reviews_section.dart';
import 'widgets/recommendations_section.dart';
import 'widgets/booking_button.dart';

class PropertyDetailsScreen extends ConsumerStatefulWidget {
  final String propertyId;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfRooms;
  final int numberOfAdults;
  final int numberOfChildren;
  final List<int>? children; // ages (0 for <1)
  final HotelItem hotel; // Added hotel object

  const PropertyDetailsScreen({
    super.key,
    required this.propertyId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfRooms,
    required this.numberOfAdults,
    required this.numberOfChildren,
    this.children,
    required this.hotel,
  });

  @override
  ConsumerState<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends ConsumerState<PropertyDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // TODO: Initialize property details data loading using the new getPropertyDetails method
    // TODO: Call ref.read(propertiesRepositoryProvider).getPropertyDetails(...) with widget params
    print('Property Details Screen initialized with:');
    print('Property ID: ${widget.propertyId}');
    print('Check-in: ${widget.checkInDate}');
    print('Check-out: ${widget.checkOutDate}');
    print('Rooms: ${widget.numberOfRooms}');
    print('Adults: ${widget.numberOfAdults}');
    print('Children: ${widget.numberOfChildren}');
    print('Children Ages: ${widget.children}');
  }

  void _onScroll() {
    final scrollOffset = _scrollController.offset;
    final shouldExpand = scrollOffset > 100;

    if (shouldExpand != _isExpanded) {
      setState(() {
        _isExpanded = shouldExpand;
      });
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
    final colorScheme = theme.colorScheme;

    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: _isExpanded ? Brightness.dark : Brightness.light,
        statusBarBrightness: _isExpanded ? Brightness.light : Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background hero image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  // Use actual property image from hotel object
                  image: widget.hotel.image.startsWith('http')
                      ? NetworkImage(widget.hotel.image) as ImageProvider
                      : AssetImage(widget.hotel.image),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Scrollable content sheet
          DraggableScrollableSheet(
            initialChildSize: 0.65, // Start at 65% of screen height
            minChildSize: 0.65,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    // Property header info
                    SliverToBoxAdapter(
                      child: PropertyHeader(hotel: widget.hotel),
                    ),

                    // Common facilities
                    const SliverToBoxAdapter(
                      child: CommonFacilities(),
                    ),

                    // Description
                    const SliverToBoxAdapter(
                      child: PropertyDescription(),
                    ),

                    // Location
                    SliverToBoxAdapter(
                      child: LocationSection(hotel: widget.hotel),
                    ),

                    // Reviews (only shown when expanded)
                    const SliverToBoxAdapter(
                      child: ReviewsSection(),
                    ),

                    // Recommendations (only shown when expanded)
                    const SliverToBoxAdapter(
                      child: RecommendationsSection(),
                    ),

                    // Bottom spacing for the booking button
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 100),
                    ),
                  ],
                ),
              );
            },
          ),

          // Top app bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),

                    // Title (only show when expanded)
                    AnimatedOpacity(
                      opacity: _isExpanded ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        'Detail',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // More button
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: _isExpanded
                            ? Colors.transparent
                            : Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          // TODO: Show more options
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          color: _isExpanded ? colorScheme.onSurface : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Floating booking button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BookingButton(hotel: widget.hotel),
          ),
        ],
      ),
    );
  }
}

