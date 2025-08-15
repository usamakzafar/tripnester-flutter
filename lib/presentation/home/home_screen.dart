import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/search_card.dart';
import 'widgets/section_header.dart';
import 'widgets/empty_section.dart';
import '../ui_kit/widgets/glass_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload the hero image to prevent pop-in
    precacheImage(const AssetImage('assets/images/illustrations/scenic.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // const SizedBox(height: 24),
        //     Image.asset('assets/images/logos/logo-white-padded.png',
        //       height: 64,
        //       errorBuilder: (context, error, stackTrace) => Icon(
        //         Icons.hotel,
        //         size: 48,
        //         color: colorScheme.onPrimary,
        //       ),
        //     )
        //   ]
        // ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Remove back button on home screen
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white, // Ensure text is white for contrast
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // Light icons for dark gradient
          statusBarBrightness: Brightness.dark, // For iOS
        ),
      ),
      body: Stack(
        children: [
          // 1) Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/illustrations/scenic-with-logo.png',
              // fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              filterQuality: FilterQuality.low, // perf
            ),
          ),
          // 2) Top-to-bottom gradient overlay for readability
          // Positioned.fill(
          //   child: IgnorePointer(
          //     child: DecoratedBox(
          //       decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //           colors: [
          //             Colors.black.withOpacity(0.35), // darken top for AppBar/title
          //             Colors.black.withOpacity(0.10),
          //             Colors.black.withOpacity(0.05),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // 3) Foreground scrollable content
          const SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 16 + 56 /* visual spacing below appbar */, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  GlassCard(
                    padding: EdgeInsets.all(16),
                    child: SearchCard(),
                  ),
                  SizedBox(height: 24),
                  SectionHeader(title: 'Recent Searches'),
                  SizedBox(height: 16),
                  EmptySection(
                    message: 'No recent searches yet',
                    description: 'Your recent hotel searches will appear here',
                  ),
                  SizedBox(height: 32),
                  SectionHeader(title: 'Popular Destinations'),
                  SizedBox(height: 16),
                  EmptySection(
                    message: 'Popular destinations coming soon',
                    description: 'Discover trending places to stay',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
