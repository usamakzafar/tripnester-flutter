import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_response_dto.freezed.dart';
part 'refresh_response_dto.g.dart';

@freezed
class RefreshResponseDto with _$RefreshResponseDto {
  const factory RefreshResponseDto({
    required String accessToken,
    required String refreshToken,
  }) = _RefreshResponseDto;

  factory RefreshResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseDtoFromJson(json);
}
