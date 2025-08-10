import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/mappers/user_mapper.dart';
import '../datasources/remote/user_api.dart';
import '../models/auth/login_request_dto.dart';
import '../../core/session/token_store.dart';
import '../../core/session/session_controller.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required this.userApi,
    required this.tokenStore,
    required this.sessionController,
  });
  final UserApi userApi;
  final TokenStore tokenStore;
  final SessionController sessionController;

  @override
  Future<AppUser> login({
    required String username,
    required String password,
  }) async {
    final dto = await userApi.login(
      LoginRequestDto(username: username, password: password),
    );
    await tokenStore.setSession(
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );
    return dto.user.toDomain();
  }

  @override
  Future<void> logout() async {
    await tokenStore.clear();
  }

  @override
  Future<AppUser> me() async => (await userApi.me()).toDomain();

  @override
  Future<AuthTokens> refreshToken({required String refreshToken}) async {
    final r = await userApi.refreshToken(refreshToken);
    await tokenStore.setTokens(
      accessToken: r.accessToken,
      refreshToken: r.refreshToken,
    );
    return AuthTokens(access: r.accessToken, refresh: r.refreshToken);
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
    await tokenStore.setSession(
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );
    await sessionController.setAuthenticated(
      user: user,
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );
    return user;
  }
}
