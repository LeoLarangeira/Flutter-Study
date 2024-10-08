// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$isFormvalidComputed;

  @override
  bool get isFormvalid =>
      (_$isFormvalidComputed ??= Computed<bool>(() => super.isFormvalid,
              name: '_LoginStore.isFormvalid'))
          .value;
  Computed<bool>? _$emailIsValidComputed;

  @override
  bool get emailIsValid =>
      (_$emailIsValidComputed ??= Computed<bool>(() => super.emailIsValid,
              name: '_LoginStore.emailIsValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;
  Computed<bool>? _$passwordContainsComputed;

  @override
  bool get passwordContains => (_$passwordContainsComputed ??= Computed<bool>(
          () => super.passwordContains,
          name: '_LoginStore.passwordContains'))
      .value;

  late final _$isObservableAtom =
      Atom(name: '_LoginStore.isObservable', context: context);

  @override
  bool get isObservable {
    _$isObservableAtom.reportRead();
    return super.isObservable;
  }

  @override
  set isObservable(bool value) {
    _$isObservableAtom.reportWrite(value, super.isObservable, () {
      super.isObservable = value;
    });
  }

  late final _$emailAtom = Atom(name: '_LoginStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObservable: ${isObservable},
email: ${email},
password: ${password},
isFormvalid: ${isFormvalid},
emailIsValid: ${emailIsValid},
isPasswordValid: ${isPasswordValid},
passwordContains: ${passwordContains}
    ''';
  }
}
