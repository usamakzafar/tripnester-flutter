import '../../domain/entities/property/property_details.dart';
import '../../domain/entities/property/property_rooms.dart';
import '../models/property/property_details_response_dto.dart';
import '../models/property/property_rooms_response_dto.dart';

class PropertyDetailsMapper {
  static PropertyDetails fromDto(PropertyDetailsResponseDto dto) {
    return PropertyDetails(
      isPropertyAvailable: dto.isPropertyAvailable,
      id: dto.id,
      hid: dto.hid,
      name: dto.name,
      address: dto.address,
      lat: dto.geo.lat,
      lng: dto.geo.lng,
      amenities: dto.amenities
          .map((amenityDto) => AmenityGroup(
                amenities: amenityDto.amenities,
                nonFreeAmenities: amenityDto.nonFreeAmenities,
                groupName: amenityDto.groupName,
              ))
          .toList(),
      minPricePerNight: dto.minPricePerNight,
      hasDiscount: dto.hasDiscount,
      discountAmount: dto.discountAmount,
      cancellable: dto.cancellable,
      freeCancellationUntil: _parseDateTime(dto.freeCancellationUntil),
      currency: dto.currency,
      provider: dto.provider,
      description: dto.description,
      propertyDetails: dto.propertyDetails,
      generalRoomInfo: dto.generalRoomInfo,
      images: dto.images
          .map((imageDto) => PropertyImage(
                url: imageDto.url,
                categorySlug: imageDto.categorySlug,
              ))
          .toList(),
      checkInTime: dto.checkInTime,
      checkOutTime: dto.checkOutTime,
      phone: dto.phone,
      postalCode: dto.postalCode,
      kind: dto.kind,
      starRating: dto.starRating,
    );
  }

  static DateTime? _parseDateTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return null;
    try {
      return DateTime.parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }
}

class PropertyRoomsMapper {
  static PropertyRooms fromDto(PropertyRoomsResponseDto dto) {
    return PropertyRooms(
      id: dto.id,
      hid: dto.hid,
      roomsData: dto.roomsData
          .map((roomDto) => RoomOption(
                roomPreBookId: roomDto.roomPreBookId,
                amenities: roomDto.amenities,
                minNightRate: roomDto.minNightRate,
                includesBreakfast: roomDto.includesBreakfast,
                beddingType: roomDto.beddingType,
                hasBalcony: roomDto.hasBalcony,
                totalAmount: roomDto.totalAmount,
                includedTaxes: roomDto.includedTaxes
                    .map((taxDto) => Tax(
                          type: taxDto.type,
                          amount: taxDto.amount,
                          currency: taxDto.currency,
                        ))
                    .toList(),
                nonIncludedTaxes: roomDto.nonIncludedTaxes
                    .map((taxDto) => Tax(
                          type: taxDto.type,
                          amount: taxDto.amount,
                          currency: taxDto.currency,
                        ))
                    .toList(),
                cancellable: roomDto.cancellable,
                cancellableUntil: _parseDateTime(roomDto.cancellableUntil),
                name: roomDto.name,
                images: roomDto.images,
              ))
          .toList(),
      currency: dto.currency,
    );
  }

  static DateTime? _parseDateTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return null;
    try {
      return DateTime.parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }
}
