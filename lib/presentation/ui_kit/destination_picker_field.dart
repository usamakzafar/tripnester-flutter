import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../search/search_screen.dart';

class SelectedDestination {
  final String name;
  const SelectedDestination(this.name);
}

class DestinationPickerField extends StatelessWidget {
  const DestinationPickerField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  final TextEditingController controller;
  final String label;
  final String hint;

  Future<void> _openPicker(BuildContext context) async {
    // Present search screen from bottom as a modal sheet
    final result = await showModalBottomSheet<SelectedDestination>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.94,
      ),
      builder: (ctx) {
        // Ensure status bar remains readable
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ));
        return const SearchScreen();
      },
    );

    if (result != null) {
      controller.text = result.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      readOnly: true,
      showCursor: false,
      enableInteractiveSelection: false,
      onTap: () => _openPicker(context),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: colorScheme.surface.withValues(alpha: 0.9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}

