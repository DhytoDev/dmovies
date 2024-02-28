final class NetworkException implements Exception {
  final int status;
  final String? message;

  const NetworkException({
    required this.status,
    this.message,
  });
}
