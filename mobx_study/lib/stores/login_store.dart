import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      print("Email is Valid?");
      print(isFormvalid);
      print("Password contains=> ");
      print(passwordContains);
    });
  }

  @observable
  bool isObservable = false;

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isFormvalid => emailIsValid && isPasswordValid && passwordContains;

  @computed
  bool get emailIsValid =>
      RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$").hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get passwordContains {
    const specialChars = '123456789!@#*()';
    return specialChars.split('').any((char) => password.contains(char));
  }
}
