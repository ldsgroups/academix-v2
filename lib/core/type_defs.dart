import 'package:academix/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

/// A type alias representing a combination of a Future and an Either monad.
///
/// The [FutureEither] type is used to represent an asynchronous operation that
/// can either succeed with a value of type [T] or fail with a [Failure].
/// It combines the concepts of a Future and an Either monad.
///
/// The type parameter [T] represents the type of the success value.
/// The [Failure] type represents the type of failure or error.
typedef FutureEither<T> = Future<Either<ServerFailure, T>>;

/// A type alias representing a [FutureEither] with a void success value.
///
/// The [FutureEitherVoid] type is used to represent an asynchronous operation
/// that can either succeed with no value (void) or fail with a [Failure].
/// It is a specialization of the [FutureEither] type alias with void as the success type.
typedef FutureEitherVoid = FutureEither<void>;

/// A type alias representing a combination of a Stream and an Either monad.
///
/// The [StreamEither] type is used to represent a stream of asynchronous operations
/// that can either succeed with a value of type [T] or fail with a [Failure].
/// It combines the concepts of a Stream and an Either monad.
///
/// The type parameter [T] represents the type of the success value.
/// The [Failure] type represents the type of failure or error.
typedef StreamEither<T> = Stream<Either<Failure, T>>;

typedef SimpleEither<T> = Either<Failure, T>;

typedef Mapper<T> = Map<String, T>;
