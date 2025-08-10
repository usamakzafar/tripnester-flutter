import '../entities/user.dart';
import '../entities/auth_tokens.dart';

abstract class UserRepository {
  Future<AppUser> login({required String username, required String password});
  Future<AppUser> me();
  Future<void> logout();
  Future<AuthTokens> refreshToken({required String refreshToken});
  Future<AppUser> register({
    required String username,
    required String password,
    required String name,
  });
}
