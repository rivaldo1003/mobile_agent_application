import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  bool disposed = false;

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}

class StateViewModel<T> extends BaseViewModel {
  StateViewModel(this._state);

  T _state;

  T get state {
    return _state;
  }

  @protected
  bool updateShouldNotify(
    T old,
    T current,
  ) =>
      !identical(old, current);

  @protected
  set state(T value) {
    final previousState = _state;
    _state = value;

    /// only notify listeners when needed
    if (!updateShouldNotify(previousState, value)) {
      return;
    }
    notifyListeners();
  }
}
