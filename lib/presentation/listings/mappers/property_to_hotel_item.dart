import 'package:tripnester/domain/entities/search/search_property.dart';
import 'package:tripnester/presentation/search/widgets/hotel_item_card.dart';
import 'package:tripnester/core/utils/image_util.dart';

// In our project, listings use SearchProperty from the Search domain.
// Provide a local alias to match the desired mapper signature name without altering domain types.
typedef RegionalProperty = SearchProperty;

HotelItem mapProperty(RegionalProperty p) {
  final raw = (p.images.isNotEmpty ? p.images.first.url : null);
  final imageUrl = raw == null
      ? 'assets/images/thumbs/thumb-green.png'
      : ImageUtil.buildUrl(raw, CdnImageSize.thumb240);

  return HotelItem(
    id: p.id, // Added property ID
    name: p.name,
    location: p.address, // Domain doesn't expose city/country; show address
    price: '${p.currency} ${p.minPricePerNight.toStringAsFixed(0)}/night', // TODO handle price formatting globally, don't hardcode here
    rating: p.starRating.isNotEmpty ? p.starRating : '-',
    image: imageUrl,
  );
}
