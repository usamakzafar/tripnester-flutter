import 'package:flutter/material.dart';

class RecentSearchesSection extends StatelessWidget {
  const RecentSearchesSection({super.key});

  final List<RecentSearch> _recentSearches = const [
    RecentSearch(
      hotelName: 'Golden Sands Retreat',
      location: 'Clearwater, FL',
    ),
    RecentSearch(
      hotelName: 'Crystal Peak Lodge',
      location: 'Aspen, CO',
    ),
    RecentSearch(
      hotelName: 'Coral Bay Resort',
      location: 'Miami Beach, FL',
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
              'Recent Searches',
              style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF111111),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle clear all
              },
              child: const Text(
                'Clear All',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFFF41F52),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Recent searches list
        Column(
          children: _recentSearches.asMap().entries.map((entry) {
            final index = entry.key;
            final search = entry.value;

            return Column(
              children: [
                RecentSearchItem(search: search),
                if (index < _recentSearches.length - 1) ...[
                  const SizedBox(height: 12),
                  Container(
                    height: 1,
                    color: const Color(0xFFFEFEFE),
                  ),
                  const SizedBox(height: 12),
                ],
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class RecentSearchItem extends StatelessWidget {
  final RecentSearch search;

  const RecentSearchItem({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle search item tap
      },
      child: Row(
        children: [
          // Clock icon
          Container(
            width: 24,
            height: 24,
            child: const Icon(
              Icons.access_time,
              color: Color(0xFF9CA4AB),
              size: 20,
            ),
          ),

          const SizedBox(width: 15),

          // Hotel info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  search.hotelName,
                  style: const TextStyle(
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF171725),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  search.location,
                  style: const TextStyle(
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF9CA4AB),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecentSearch {
  final String hotelName;
  final String location;

  const RecentSearch({
    required this.hotelName,
    required this.location,
  });
}
