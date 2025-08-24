import 'package:flutter_test/flutter_test.dart';
import 'package:tripnester/data/models/property/property_request_dto.dart';
import 'package:tripnester/data/models/property/property_details_response_dto.dart';
import 'package:tripnester/data/models/property/property_rooms_response_dto.dart';

void main() {
  group('Property DTOs', () {
    test('PropertyRequestDto serialization', () {
      final dto = PropertyRequestDto(
        checkInDate: '2025-08-25',
        checkOutDate: '2025-08-27',
        numberOfRooms: 1,
        numberOfAdults: 2,
        numberOfChildren: 0,
        residency: 'US',
        currency: 'EUR',
      );

      final json = dto.toJson();
      expect(json['checkInDate'], '2025-08-25');
      expect(json['checkOutDate'], '2025-08-27');
      expect(json['numberOfRooms'], 1);
      expect(json['numberOfAdults'], 2);
      expect(json['numberOfChildren'], 0);
      expect(json['residency'], 'US');
      expect(json['currency'], 'EUR');
    });

    test('PropertyDetailsResponseDto deserialization', () {
      final sampleJson = {
        'isPropertyAvailable': true,
        'id': 'prop123',
        'hid': 456,
        'name': 'Grand Hotel',
        'address': '123 Main St',
        'geo': {'lat': 40.7128, 'long': -74.0060},
        'amenities': [
          {
            'amenities': ['WiFi', 'Pool'],
            'non_free_amenities': ['Spa'],
            'group_name': 'Recreation'
          }
        ],
        'minPricePerNight': 150.0,
        'hasDiscount': true,
        'discountAmount': 25,
        'cancellable': true,
        'freeCancellationUntil': '2025-08-20T18:00:00Z',
        'currency': 'EUR',
        'provider': 'TestProvider',
        'description': 'A luxury hotel',
        'propertyDetails': 'Detailed info',
        'generalRoomInfo': 'Room info',
        'images': [
          {'url': 'https://example.com/{size}/image.jpg', 'category_slug': 'exterior'}
        ],
        'checkInTime': '15:00',
        'checkOutTime': '11:00',
        'phone': '+1234567890',
        'postalCode': '10001',
        'kind': 'Hotel',
        'starRating': '4'
      };

      final dto = PropertyDetailsResponseDto.fromJson(sampleJson);
      expect(dto.name, 'Grand Hotel');
      expect(dto.geo.lat, 40.7128);
      expect(dto.geo.lng, -74.0060);
      expect(dto.amenities.length, 1);
      expect(dto.amenities.first.groupName, 'Recreation');
      expect(dto.images.length, 1);
      expect(dto.images.first.categorySlug, 'exterior');
    });

    test('PropertyRoomsResponseDto deserialization', () {
      final sampleJson = {
        'rooms': [
          {
            'id': 'room123',
            'name': 'Deluxe Room',
            'description': 'Spacious room with city view',
            'pricePerNight': 200.0,
            'currency': 'EUR',
            'cancellable': true,
            'freeCancellationUntil': '2025-08-20T18:00:00Z',
            'amenities': ['WiFi', 'TV'],
            'maxOccupancy': 3,
            'bedType': 'King',
            'images': [
              {'url': 'https://example.com/{size}/room.jpg', 'category_slug': 'room'}
            ],
            'hasDiscount': false,
            'discountAmount': 0,
            'provider': 'TestProvider'
          }
        ]
      };

      final dto = PropertyRoomsResponseDto.fromJson(sampleJson);
      expect(dto.rooms.length, 1);
      expect(dto.rooms.first.name, 'Deluxe Room');
      expect(dto.rooms.first.pricePerNight, 200.0);
      expect(dto.rooms.first.maxOccupancy, 3);
      expect(dto.rooms.first.images.length, 1);
    });
  });
}
