import 'package:core/utils/failure.dart';

sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok<T>;
  const factory Result.error(Failure failure) = Err<T>;

  T? get valueOrNull => switch (this) {
        Ok(:final value) => value,
        Err() => null,
      };

  Failure? get failureOrNull => switch (this) {
        Ok() => null,
        Err(:final failure) => failure,
      };

  R fold<R>(R Function(T value) onOk, R Function(Failure failure) onErr) =>
      switch (this) {
        Ok(:final value) => onOk(value),
        Err(:final failure) => onErr(failure),
      };

  Result<U> map<U>(U Function(T value) transform) => switch (this) {
        Ok(:final value) => Result.ok(transform(value)),
        Err(:final failure) => Result.error(failure),
      };

  Future<Result<U>> flatMap<U>(Future<Result<U>> Function(T value) next) async =>
      switch (this) {
        Ok(:final value) => await next(value),
        Err(:final failure) => Result.error(failure),
      };
}

final class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);

  @override
  String toString() => 'Ok($value)';
}

final class Err<T> extends Result<T> {
  final Failure failure;
  const Err(this.failure);

  @override
  String toString() => 'Err($failure)';
}

Future<Result<T>> runCatching<T>(Future<T> Function() body) async {
  try {
    return Result.ok(await body());
  } on Failure catch (f) {
    return Result.error(f);
  } catch (e) {
    return Result.error(UnknownFailure(e));
  }
}
