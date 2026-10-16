sealed class Failure implements Exception {
  const Failure();
}

final class UnreachableFailure extends Failure {
  final String address;
  const UnreachableFailure(this.address);

  @override
  String toString() => 'UnreachableFailure($address)';
}

final class TimeoutFailure extends Failure {
  const TimeoutFailure();
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure();
}

final class NotFoundFailure extends Failure {
  final String what;
  const NotFoundFailure(this.what);

  @override
  String toString() => 'NotFoundFailure($what)';
}

final class UnsupportedCommandFailure extends Failure {
  final String capabilityId;
  final Type commandType;
  const UnsupportedCommandFailure(this.capabilityId, this.commandType);

  @override
  String toString() => 'UnsupportedCommandFailure($capabilityId, $commandType)';
}

final class UnknownFailure extends Failure {
  final Object? cause;
  const UnknownFailure([this.cause]);

  @override
  String toString() => 'UnknownFailure($cause)';
}
