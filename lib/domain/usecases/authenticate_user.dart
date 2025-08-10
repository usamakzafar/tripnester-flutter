import '../entities/user.dart';
import '../repositories/user_repository.dart';

class AuthenticateUser {
  AuthenticateUser(this._repo);
  final UserRepository _repo;

  Future<AppUser> call({required String username, required String password}) =>
      _repo.login(username: username, password: password);
}
