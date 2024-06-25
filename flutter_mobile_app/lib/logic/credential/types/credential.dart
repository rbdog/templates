class Credential {
  const Credential({
    required this.accessToken,
    required this.refreshToken,
    required this.userID,
  });

  final String accessToken;
  final String refreshToken;
  final String userID;
}
