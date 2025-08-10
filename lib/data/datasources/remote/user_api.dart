import 'package:dio/dio.dart';
import '../../models/auth/login_request_dto.dart';
import '../../models/auth/login_response_dto.dart';
import '../../models/auth/user_dto.dart';
import '../../models/auth/refresh_response_dto.dart';
import '../../models/auth/register_response_dto.dart';
import '../../../core/network/api_exceptions.dart';

class UserApi {
  UserApi(this._dio);
  final Dio _dio;

  Future<LoginResponseDto> login(LoginRequestDto body) async {
    final res = await _dio.post('/api/auth/login', data: body.toJson());
    if (res.statusCode != 201) {
      throw ApiException('Login failed', statusCode: res.statusCode);
    }
    return LoginResponseDto.fromJson(res.data as Map<String, dynamic>);
  }

  Future<RegisterResponseDto> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final res = await _dio.post(
      '/api/auth/register',
      data: {'username': email, 'password': password, 'name': name},
    );
    return RegisterResponseDto.fromJson(res.data as Map<String, dynamic>);
  }

  Future<UserDto> me(String? accessToken) async {
    // rest of the user API doesn't have access token, only this one
    // so we pass it as an optional parameter
    final options = accessToken != null
        ? Options(headers: {'Authorization': 'Bearer $accessToken'})
        : null;
    final res = await _dio.get('/api/users/me', options: options);
    if (res.statusCode != 200) {
      throw ApiException('Me failed', statusCode: res.statusCode);
    }
    return UserDto.fromJson(res.data as Map<String, dynamic>);
  }

  Future<RefreshResponseDto> refreshToken(String refreshToken) async {
    final res = await _dio.post(
      '/api/auth/refresh_token',
      data: {'refreshToken': refreshToken},
    );
    if (res.statusCode != 200) {
      throw ApiException('Refresh failed', statusCode: res.statusCode);
    }
    return RefreshResponseDto.fromJson(res.data as Map<String, dynamic>);
  }
}
