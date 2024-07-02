abstract class Failure {
  const Failure({required this.errorMessage, this.stacktrace});
  final String errorMessage;
  final StackTrace? stacktrace;
}

class ServerFailure extends Failure {
  ServerFailure({
    required super.errorMessage,
    // required super.stacktrace,
  });
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}
