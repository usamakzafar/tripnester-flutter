import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_dto.dart';

part 'register_response_dto.freezed.dart';
part 'register_response_dto.g.dart';

@freezed
class RegisterResponseDto with _$RegisterResponseDto {
  const factory RegisterResponseDto({
    required bool success,
    required UserDto user,
    required String accessToken,
    required String refreshToken,
  }) = _RegisterResponseDto;

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDtoFromJson(json);
}
