import 'package:freezed_annotation/freezed_annotation.dart';
import 'location_dto.dart';
import '../../../domain/entities/region.dart';

part 'region_dto.freezed.dart';
part 'region_dto.g.dart';

@freezed
class RegionDto with _$RegionDto {
  const factory RegionDto({
    required String name,
    required String regionId,
    required String regionType,
    required int priority,
    required LocationDto location,
    required String countryCode,
    required String countryName,
  }) = _RegionDto;

  const RegionDto._();

  factory RegionDto.fromJson(Map<String, dynamic> json) =>
      _$RegionDtoFromJson(json);

  Region toDomain() {
    return Region(
      name: name,
      regionId: regionId,
      regionType: regionType,
      priority: priority,
      location: location.toDomain(),
      countryCode: countryCode,
      countryName: countryName,
    );
  }
}
