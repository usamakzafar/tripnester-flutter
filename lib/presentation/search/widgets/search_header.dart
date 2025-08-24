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
          SizedBox(
            width: 44,
            height: 44,
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
          const Text(
            'Find your destination',
            style: TextStyle(
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
          ),
        ],
      ),
    );
  }
}
