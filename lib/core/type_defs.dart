import 'dart:async';

import 'package:academix/core/errors/failure.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';

/// Represents the result of an asynchronous operation that can either succeed with a value of type [T] or fail with a [ServerFailure].
///
/// Combines the concepts of a [Future] (representing an asynchronous computation) and an [Either] (representing either a success value or a failure).
/// This allows us to model the result of a network request, database query, or other async operation.
///
/// **Type Parameters:**
///   - [T]: The type of the success value returned if the operation is successful.
typedef FutureEither<T> = Future<Either<ServerFailure, T>>;

/// Represents the result of an asynchronous operation that can either succeed without returning a value or fail with a [ServerFailure].
///
/// Special case of [FutureEither] where the success type is `void`. Used when the asynchronous operation doesn't need to return a specific result.
typedef FutureEitherVoid = FutureEither<void>;

/// Represents a stream of results from asynchronous operations, where each result can either be a value of type [T] (success) or a [Failure] (error).
///
/// Combines a [Stream] (representing a sequence of values over time) with the concept of [Either] to model the results of a series of asynchronous operations.
/// This can be useful for handling continuous data flows, where each item in the stream represents a separate operation that could either succeed or fail.
///
/// **Type Parameters:**
///   - [T]: The type of the success value returned in each successful stream event.
typedef StreamEither<T> = Stream<Either<Failure, T>>;

/// Represents either a value of type [T] (success) or a [Failure] (error).
///
/// A simplified type alias for [Either] that specifically uses [Failure] for the error case, making it convenient when working with operations that can either succeed with a result or fail with an error of type [Failure].
///
/// **Type Parameters:**
///   - [T]: The type of the success value returned if the operation is successful.
typedef SimpleEither<T> = Either<Failure, T>;

/// A map where keys are strings and values are of type [T].
///
/// A convenient type alias for `Map<String, T>`.
///
/// **Type Parameters:**
///   - [T]: The type of the values stored in the map.
typedef Mapper<T> = Map<String, T>;

/// A function that determines the redirection behavior within a [GoRouter].

/// Given the current [BuildContext] and [GoRouterState], this function computes the location to which the user should be redirected.

/// **Parameters:**
/// - `context`: The current build context of the widget.
/// - `state`: The current state of the GoRouter, including the current location and other relevant information.

/// **Returns:**
/// - A [FutureOr] of [String?], where:
///    - The `String` represents the new location to which the user should be redirected.
///    - `null` indicates that no redirection should occur.
///    - A `Future` that resolves to a `String` or `null` allows for asynchronous redirection decisions.
typedef GoRouterRedirect = FutureOr<String?> Function(
  BuildContext context,
  GoRouterState state,
);
