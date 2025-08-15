import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/search/property_image.dart';

part 'property_image_dto.g.dart';

@JsonSerializable()
class PropertyImageDto {
  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'categorySlug')
  final String? categorySlug;

  const PropertyImageDto({
    required this.url,
    this.categorySlug,
  });

  factory PropertyImageDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyImageDtoToJson(this);

  PropertyImage toDomain() {
    return PropertyImage(
      url: url,
      categorySlug: categorySlug,
    );
  }
}
