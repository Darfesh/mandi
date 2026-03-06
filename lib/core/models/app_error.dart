enum ErrorType {
  // Network
  network,
  timeout,

  // Auth
  sessionExpired,
  unauthorized,
  invalidCredentials,

  // Storage
  fileNotFound,
  fileTooLarge,
  invalidFileType,
  permissionDenied,
  permissionPermanentlyDenied,

  // Server
  serverError,
  rateLimitExceeded,

  // Data
  notFound,
  validation,

  // Unknown
  unknown,
}

class AppError implements Exception {
  final ErrorType type;
  final String message;
  final String? technicalDetails;
  final int? statusCode;
  final DateTime timestamp;
  final StackTrace? stackTrace;
  final String? userId;

  AppError({
    required this.type,
    required this.message,
    this.technicalDetails,
    this.statusCode,
    this.stackTrace,
    this.userId,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  @override
  String toString() {
    return 'AppError($type): $message'
        '${technicalDetails != null ? '\nDetails: $technicalDetails' : ''}'
        '${userId != null ? '\nUser: $userId' : ''}';
  }

  // Network
  factory AppError.network({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.network,
      message: ErrorType.network.name,
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }

  factory AppError.timeout({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.timeout,
      message: ErrorType.timeout.name,
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }

  // Auth
  factory AppError.sessionExpired({StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.sessionExpired,
      message: ErrorType.sessionExpired.name,
      statusCode: 401,
      stackTrace: stackTrace,
    );
  }

  factory AppError.unauthorized({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.unauthorized,
      message: ErrorType.unauthorized.name,
      technicalDetails: details,
      statusCode: 403,
      stackTrace: stackTrace,
    );
  }

  factory AppError.invalidCredentials({StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.invalidCredentials,
      message: ErrorType.invalidCredentials.name,
      statusCode: 401,
      stackTrace: stackTrace,
    );
  }

  // Storage
  factory AppError.fileNotFound({String? fileName, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.fileNotFound,
      message: ErrorType.fileNotFound.name,
      technicalDetails: fileName,
      statusCode: 404,
      stackTrace: stackTrace,
    );
  }

  factory AppError.fileTooLarge({int? maxSize, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.fileTooLarge,
      message: ErrorType.fileTooLarge.name,
      technicalDetails: maxSize != null ? 'Max size: $maxSize bytes' : null,
      statusCode: 400,
      stackTrace: stackTrace,
    );
  }

  factory AppError.invalidFileType({String? expectedType, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.invalidFileType,
      message: ErrorType.invalidFileType.name,
      technicalDetails: expectedType,
      statusCode: 400,
      stackTrace: stackTrace,
    );
  }

  // Server
  factory AppError.serverError({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.serverError,
      message: ErrorType.serverError.name,
      technicalDetails: details,
      statusCode: 500,
      stackTrace: stackTrace,
    );
  }

  factory AppError.rateLimitExceeded({StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.rateLimitExceeded,
      message: ErrorType.rateLimitExceeded.name,
      statusCode: 429,
      stackTrace: stackTrace,
    );
  }

  // Data
  factory AppError.notFound({String? resource, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.notFound,
      message: ErrorType.notFound.name,
      technicalDetails: resource,
      statusCode: 404,
      stackTrace: stackTrace,
    );
  }

  factory AppError.validation({
    required String field,
    required String reason,
    StackTrace? stackTrace,
  }) {
    return AppError(
      type: ErrorType.validation,
      message: ErrorType.validation.name,
      technicalDetails: 'Field: $field, Reason: $reason',
      stackTrace: stackTrace,
    );
  }

  // Unknown
  factory AppError.unknown({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.unknown,
      message: ErrorType.unknown.name,
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }

// Permissions
  factory AppError.permissionDenied({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.permissionDenied,
      message: ErrorType.permissionDenied.name,
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }

  factory AppError.permissionPermanentlyDenied({String? details, StackTrace? stackTrace}) {
    return AppError(
      type: ErrorType.permissionPermanentlyDenied,
      message: ErrorType.permissionPermanentlyDenied.name,
      technicalDetails: details,
      stackTrace: stackTrace,
    );
  }
}
