import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/search_header.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/recent_searches_section.dart';
import 'widgets/recently_viewed_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF8F4),
        elevation: 0,
        toolbarHeight: 0, // Hide default app bar
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            // Header with back button, title, and notification
            SearchHeader(),

            SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Search bar with filter
                    SearchBarWidget(),

                    SizedBox(height: 30),

                    // Recent Searches section
                    RecentSearchesSection(),

                    SizedBox(height: 30),

                    // Recently Viewed section
                    RecentlyViewedSection(),

                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
