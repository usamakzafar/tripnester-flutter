class AppUser {
  const AppUser({
    required this.id,
    required this.email,            // from DTO.username
    required this.name,
    this.phoneNumber,
    this.avatar,
    required this.onboardingCompleted,
    required this.isOAuthAccount,
    required this.roles,            // list of role strings, e.g. ["regular"]
  });

  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final String? avatar;
  final bool onboardingCompleted;
  final bool isOAuthAccount;
  final List<String> roles;
}
