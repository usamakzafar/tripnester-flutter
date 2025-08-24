import 'package:flutter/material.dart';

class HotelItemCard extends StatelessWidget {
  final HotelItem hotel;

  const HotelItemCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        // Handle hotel card tap
      },
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 150, // Match hotel image height
        child: Row(
          children: [
            // Hotel image
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7.88),
                  bottomLeft: Radius.circular(7.88),
                ),
                image: DecorationImage(
                  image: _imageProvider(hotel.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Hotel details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hotel name and location
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              style: TextStyle(
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: scheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 16,
                                  color: scheme.secondary,
                                ),
                                const SizedBox(width: 4),

                                Expanded(
                                  child: Text(
                                    hotel.location,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: scheme.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Rating
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Color(0xFFEDB900),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            hotel.rating,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFF171725),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Price
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hotel.price,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: scheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),)
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _imageProvider(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path);
    }
    return AssetImage(path);
  }
}

class HotelItem {
  final String name;
  final String location;
  final String price;
  final String rating;
  final String image;

  const HotelItem({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.image,
  });
}
