import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, this.onChanged, this.focusNode});

  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE9EBED)),
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Search icon and text field
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Color(0xFF78828A),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: widget.focusNode,
                      onChanged: widget.onChanged,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF9CA4AB),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        focusColor: null,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        fillColor: Colors.transparent,
                      ),
                      style: const TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF171725),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Divider line
          Container(
            width: 1,
            height: 18,
            color: const Color(0xFFE9EBED),
          ),

          // Filter button
          SizedBox(
            width: 50,
            height: 52,
            child: IconButton(
              onPressed: () {
                // Handle filter tap
              },
              icon: const Icon(
                Icons.tune,
                color: Color(0xFF171725),
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
