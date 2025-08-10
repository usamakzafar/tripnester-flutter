import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Session state for authenticated user and tokens.
/// TODO(auth): Implement secure persistence using flutter_secure_storage.
class SessionState {
  final String? accessToken;
  final String? refreshToken;

  const SessionState({this.accessToken, this.refreshToken});

  SessionState copyWith({String? accessToken, String? refreshToken}) {
    return SessionState(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}

/// TokenStore manages reading/writing tokens and notifying listeners.
/// TODO(auth): Wire hydrate(), setSession(), setTokens(), clear().
class TokenStore extends StateNotifier<SessionState> {
  TokenStore() : super(const SessionState());

  // TODO(auth): hydrate() from flutter_secure_storage on app start.
  // TODO(auth): setSession(user, access, refresh) once login succeeds.
  // TODO(auth): setTokens(access, refresh) after refresh_token API.
  // TODO(auth): clear() on logout/failed refresh.
}

/// TODO(auth): Later, provide a StateNotifierProvider for TokenStore in DI.
