import '../../domain/entities/user.dart';

/// Represents the current session state of the application
class SessionState {
  const SessionState({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.isRestoring,
  });

  final AppUser? user;
  final String? accessToken;
  final String? refreshToken;
  final bool isRestoring;

  /// Whether the user is authenticated
  bool get isAuthenticated => user != null && accessToken != null;

  /// Whether the session is loading/restoring
  bool get isLoading => isRestoring;

  /// Copy method for immutable updates
  SessionState copyWith({
    AppUser? user,
    String? accessToken,
    String? refreshToken,
    bool? isRestoring,
  }) {
    return SessionState(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      isRestoring: isRestoring ?? this.isRestoring,
    );
  }

  /// Clear session data
  SessionState clearSession() {
    return const SessionState(
      user: null,
      accessToken: null,
      refreshToken: null,
      isRestoring: false,
    );
  }

  /// Initial state when app starts
  factory SessionState.initial() => const SessionState(
    user: null,
    accessToken: null,
    refreshToken: null,
    isRestoring: true,
  );

  /// Authenticated state
  factory SessionState.authenticated({
    required AppUser user,
    required String accessToken,
    required String refreshToken,
  }) => SessionState(
    user: user,
    accessToken: accessToken,
    refreshToken: refreshToken,
    isRestoring: false,
  );

  /// Unauthenticated state
  factory SessionState.unauthenticated() => const SessionState(
    user: null,
    accessToken: null,
    refreshToken: null,
    isRestoring: false,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionState &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken &&
          isRestoring == other.isRestoring;

  @override
  int get hashCode =>
      user.hashCode ^
      accessToken.hashCode ^
      refreshToken.hashCode ^
      isRestoring.hashCode;

  @override
  String toString() {
    return 'SessionState{user: $user, hasAccessToken: ${accessToken != null}, hasRefreshToken: ${refreshToken != null}, isRestoring: $isRestoring}';
  }
}
