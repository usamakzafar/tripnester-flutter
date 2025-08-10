import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/di/injection_container.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/authenticate_user.dart';
import '../../domain/usecases/register_user.dart';

class SignInController extends StateNotifier<AsyncValue<AppUser?>> {
  SignInController(this._auth) : super(const AsyncValue.data(null));

  final AuthenticateUser _auth;

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _auth(email: email, password: password);
      // Session persistence is now handled in the repository layer
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

class RegisterController extends StateNotifier<AsyncValue<AppUser?>> {
  RegisterController(this._register) : super(const AsyncValue.data(null));

  final RegisterUser _register;

  Future<void> register({required String email, required String password, required String name}) async {
    state = const AsyncValue.loading();
    try {
      final user = await _register(email: email, password: password, name: name);
      // Session persistence is now handled in the repository layer
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final signInControllerProvider =
    StateNotifierProvider.autoDispose<SignInController, AsyncValue<AppUser?>>(
      (ref) => SignInController(ref.read(authenticateUserProvider)),
    );

final registerControllerProvider = StateNotifierProvider.autoDispose<RegisterController, AsyncValue<AppUser?>>(
  (ref) => RegisterController(ref.read(registerUserProvider)),
);
