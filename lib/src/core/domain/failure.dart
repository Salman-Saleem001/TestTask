import 'package:bloc_demo/main_export.dart';

abstract class Failure extends Equatable{
  final String message;
  final int? statusCode;

  const Failure(this.message, [this.statusCode]);
  @override
  List<Object?> get props => [message, statusCode];
}

class ForbiddenFailure extends Failure {
  final String? requiredRole;
  final String? currentRole;

  const ForbiddenFailure({
    required String message,
    this.requiredRole,
    this.currentRole,
  }) : super(message, 403);
}

// Other specialized failure classes
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(String message) : super(message, 401);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message, 502);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(String message) : super(message, 400);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(String message) : super(message, 404);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class ParsingFailure extends Failure {
  const ParsingFailure(super.message);
}