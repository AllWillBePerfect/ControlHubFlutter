import 'package:core/utils/result.dart';
import 'package:flutter/foundation.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A arg);

abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  Result<T>? _result;

  bool get running => _running;
  Result<T>? get result => _result;
  bool get completed => _result is Ok<T>;
  bool get failed => _result is Err<T>;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _run(CommandAction0<T> action) async {
    if (_running) return;
    _running = true;
    _result = null;
    notifyListeners();
    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends Command<T> {
  final CommandAction0<T> _action;
  Command0(this._action);

  Future<void> execute() => _run(_action);
}

class Command1<T, A> extends Command<T> {
  final CommandAction1<T, A> _action;
  Command1(this._action);

  Future<void> execute(A arg) => _run(() => _action(arg));
}
