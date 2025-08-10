import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../core/di/injection_container.dart';
import 'sign_in_controller.dart';

final signInControllerProvider = StateNotifierProvider.autoDispose<SignInController, AsyncValue<AppUser?>>(
  (ref) => SignInController(ref.read(authenticateUserProvider)),
);
