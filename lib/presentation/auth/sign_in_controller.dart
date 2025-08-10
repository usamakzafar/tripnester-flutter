import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/authenticate_user.dart';

class SignInController extends StateNotifier<AsyncValue<AppUser?>> {
  SignInController(this._auth) : super(const AsyncValue.data(null));
  final AuthenticateUser _auth;

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _auth(email: email, password: password);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
