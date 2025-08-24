class PropertyRooms {
  final String id;
  final int hid;
  final List<RoomOption> roomsData;
  final String currency;

  const PropertyRooms({
    required this.id,
    required this.hid,
    required this.roomsData,
    required this.currency,
  });
}

class RoomOption {
  final String roomPreBookId;
  final List<String> amenities;
  final double minNightRate;
  final bool includesBreakfast;
  final String beddingType;
  final bool hasBalcony;
  final double totalAmount;
  final List<Tax> includedTaxes;
  final List<Tax> nonIncludedTaxes;
  final bool cancellable;
  final DateTime? cancellableUntil;
  final String name;
  final List<String> images;

  const RoomOption({
    required this.roomPreBookId,
    required this.amenities,
    required this.minNightRate,
    required this.includesBreakfast,
    required this.beddingType,
    required this.hasBalcony,
    required this.totalAmount,
    required this.includedTaxes,
    required this.nonIncludedTaxes,
    required this.cancellable,
    this.cancellableUntil,
    required this.name,
    required this.images,
  });
}

class Tax {
  final String type;
  final String amount;
  final String currency;

  const Tax({
    required this.type,
    required this.amount,
    required this.currency,
  });
}
