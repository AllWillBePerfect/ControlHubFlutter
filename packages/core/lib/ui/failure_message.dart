import 'package:core/utils/failure.dart';

String failureMessage(Failure f) => switch (f) {
      UnreachableFailure(:final address) => 'Нет связи: $address',
      TimeoutFailure() => 'Источник не отвечает',
      UnauthorizedFailure() => 'Неверный токен',
      NotFoundFailure(:final what) => 'Не найдено: $what',
      UnsupportedCommandFailure() => 'Команда не поддерживается',
      UnknownFailure() => 'Неизвестная ошибка',
    };
