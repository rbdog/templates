class Credential {
  const Credential({
    required this.token,
    required this.refreshToken,
    required this.userId,
  });

  final String token;
  final String refreshToken;
  final String userId;
}
