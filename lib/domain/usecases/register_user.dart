import '../entities/user.dart';
import '../repositories/user_repository.dart';

class RegisterUser {
  RegisterUser(this._repo);
  final UserRepository _repo;

  Future<AppUser> call({
    required String email,
    required String password,
    required String name,
  }) {
    return _repo.register(email: email, password: password, name: name);
  }
}
