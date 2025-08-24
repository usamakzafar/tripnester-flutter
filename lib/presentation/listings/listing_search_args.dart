import 'package:flutter/material.dart';

class ListingSearchArgs {
  final String regionId;
  final String? propertyId;
  final String locationName;
  final DateTimeRange stayRange;
  final int rooms;
  final int adults;
  final int children;
  final String residency;
  final List<int> starRatings;
  final String currency;
  final List<int>? childrenAges;

  const ListingSearchArgs({
    required this.regionId,
    this.propertyId,
    required this.locationName,
    required this.stayRange,
    this.rooms = 1,
    required this.adults,
    required this.children,
    this.residency = 'US',
    this.currency = 'USD',
    this.starRatings = const [0, 1, 2, 3, 4, 5],
    this.childrenAges,
  });
}
