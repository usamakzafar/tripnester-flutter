import '../entities/user.dart';
import '../repositories/user_repository.dart';

class AuthenticateUser {
  AuthenticateUser(this._repo);
  final UserRepository _repo;

  Future<AppUser> call({required String email, required String password}) =>
      _repo.login(username: email, password: password);
}
