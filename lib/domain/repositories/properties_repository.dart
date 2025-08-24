import '../entities/property/property_details.dart';
import '../entities/property/property_rooms.dart';

abstract class PropertiesRepository {
  Future<PropertyDetails> getPropertyDetails({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
  });

  Future<PropertyRooms> getPropertyRooms({
    required String propertyId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfRooms,
    required int numberOfAdults,
    required int numberOfChildren,
  });
}
