import '../search/widgets/hotel_item_card.dart';

class PropertyDetailsArgs {
  final String propertyId;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfRooms;
  final int numberOfAdults;
  final int numberOfChildren;
  final List<int>? children; // ages (0 for <1)
  final HotelItem hotel; // Added hotel object

  const PropertyDetailsArgs({
    required this.propertyId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfRooms,
    required this.numberOfAdults,
    required this.numberOfChildren,
    this.children,
    required this.hotel,
  });
}
