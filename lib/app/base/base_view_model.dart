import 'package:flutter/material.dart';

abstract class BaseViewModel<STATE> extends ChangeNotifier {
  STATE _state;

  BaseViewModel(this._state);

  @protected
  set state(STATE value) {
    _state = value;
    notifyListeners();
  }

  STATE get state => _state;
}
