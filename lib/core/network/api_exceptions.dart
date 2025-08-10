class ApiException implements Exception {
  final String message;
  final int? statusCode;
  const ApiException(this.message, {this.statusCode});
  @override
  String toString() => 'ApiException($statusCode): $message';
}

/// TODO(api): Add typed exceptions if needed:
/// - UnauthorizedException
/// - ForbiddenException
/// - NotFoundException
/// - ServerException
/// All should extend ApiException.
