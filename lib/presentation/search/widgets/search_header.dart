import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFFFEFEFE),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => context.pop(), // Use go_router's pop for proper navigation
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF171725),
                size: 20,
              ),
            ),
          ),

          // Title
          Text(
            'Search',
            style: const TextStyle(
              fontFamily: 'Jost',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF171725),
            ),
          ),

          // Notification button
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                Center(
                  child: IconButton(
                    onPressed: () {
                      // Handle notification tap
                    },
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFF171725),
                      size: 24,
                    ),
                  ),
                ),
                // Red notification dot
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF41F52),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFAF8F4),
                        width: 1.5,
                      ),
                    ),
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
