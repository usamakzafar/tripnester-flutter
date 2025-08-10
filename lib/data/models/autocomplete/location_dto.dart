import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/location.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    required double lat,
    required double long,
  }) = _LocationDto;

  const LocationDto._();

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Location toDomain() {
    return Location(
      lat: lat,
      long: long,
    );
  }
}
