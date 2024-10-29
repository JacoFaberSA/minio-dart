class MinioCredentials {
  MinioCredentials(
    this.accessKey,
    this.secretKey, {
    this.sessionToken,
    this.expiration,
  });

  /// accessKey is like user-id that uniquely identifies your account.
  final String accessKey;

  /// secretKey is the password to your account.
  final String secretKey;

  /// Set this value to provide x-amz-security-token (AWS S3 specific). (Optional)
  final String? sessionToken;

  /// Expiry of the session token (AWS S3 specific). (Optional)
  final DateTime? expiration;

  bool get hasSessionToken => sessionToken != null;

  bool get hasExpiration => expiration != null;

  bool get isExpired =>
      expiration != null &&
      expiration!.isBefore(
        DateTime.now().toUtc().add(
              const Duration(minutes: 15),
            ),
      );
}
