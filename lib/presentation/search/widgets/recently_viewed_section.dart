import 'package:flutter/material.dart';
import 'hotel_item_card.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({super.key});

  final List<HotelItem> _recentlyViewed = const [
    HotelItem(
      id: 'hotel_mystic_palms',
      name: 'Mystic Palms',
      location: 'Palm Springs, CA',
      price: '\$230 /night',
      rating: '4.0',
      image: 'assets/images/sample/hotel/hotel_mystic_palms.png',
    ),
    HotelItem(
      id: 'hotel_sapphire_cove',
      name: 'Sapphire Cove Hotel',
      location: 'Key West, FL',
      price: '\$290 /night',
      rating: '3.8',
      image: 'assets/images/sample/hotel/hotel_sapphire_cove.png',
    ),
    HotelItem(
      id: "hotel_elysian_suites",
      name: 'Elysian Suites',
      location: 'San Diego, CA',
      price: '\$320 /night',
      rating: '3.8',
      image: 'assets/images/sample/hotel/hotel_elysian_suites.png',
    ),
    HotelItem(
      id: 'hotel_serenity_sands',
      name: 'Serenity sands',
      location: 'San Diego, CA',
      price: '\$320 /night',
      rating: '3.8',
      image: 'assets/images/sample/hotel/hotel_serenity_sands.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recently Viewed',
              style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF171725),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle see all
              },
              child: const Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF004E4F),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Hotel cards list
        Column(
          children: _recentlyViewed.asMap().entries.map((entry) {
            final index = entry.key;
            final hotel = entry.value;

            return Column(
              children: [
                HotelItemCard(hotel: hotel),
                if (index < _recentlyViewed.length - 1) ...[
                  const SizedBox(height: 16),
                  Container(
                    height: 1,
                    color: const Color(0xFFE9EBED),
                  ),
                  const SizedBox(height: 16),
                ],
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
