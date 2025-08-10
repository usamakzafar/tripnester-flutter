import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/mappers/user_mapper.dart';
import '../datasources/remote/user_api.dart';
import '../models/auth/login_request_dto.dart';
import '../../core/session/session_controller.dart';

/// Authentication result containing user and tokens
class AuthResult {
  const AuthResult({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  final AppUser user;
  final String accessToken;
  final String refreshToken;
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.userApi,
    required this.sessionController,
  });

  final UserApi userApi;
  final SessionController sessionController;

  @override
  Future<AppUser> login({
    required String username,
    required String password,
  }) async {
    final dto = await userApi.login(
      LoginRequestDto(username: username, password: password),
    );

    final user = dto.user.toDomain();

    // Save session using the session controller
    await sessionController.signInOrRegisterSuccess(
      user: user,
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );

    return user;
  }

  @override
  Future<AppUser> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final dto = await userApi.register(
      email: email,
      password: password,
      name: name,
    );

    final user = dto.user.toDomain();

    // Save session using the session controller
    await sessionController.signInOrRegisterSuccess(
      user: user,
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );

    return user;
  }

  @override
  Future<void> logout() async {
    await sessionController.signOut();
  }

  @override
  Future<AppUser> me() async => (await userApi.me(sessionController.getAccessToken())).toDomain();

  @override
  Future<AuthTokens> refreshToken({required String refreshToken}) async {
    final r = await userApi.refreshToken(refreshToken);
    return AuthTokens(access: r.accessToken, refresh: r.refreshToken);
  }
}
