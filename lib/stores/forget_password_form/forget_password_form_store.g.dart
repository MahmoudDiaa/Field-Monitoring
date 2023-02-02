// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgetPasswordFormStore on _ForgetPasswordFormStore, Store {
  Computed<bool>? _$canSendForgetPasswordCodeComputed;

  @override
  bool get canSendForgetPasswordCode => (_$canSendForgetPasswordCodeComputed ??=
          Computed<bool>(() => super.canSendForgetPasswordCode,
              name: '_ForgetPasswordFormStore.canSendForgetPasswordCode'))
      .value;
  Computed<bool>? _$canChangePasswordComputed;

  @override
  bool get canChangePassword => (_$canChangePasswordComputed ??= Computed<bool>(
          () => super.canChangePassword,
          name: '_ForgetPasswordFormStore.canChangePassword'))
      .value;
  Computed<bool>? _$isSendingCodeInComputed;

  @override
  bool get isSendingCodeIn =>
      (_$isSendingCodeInComputed ??= Computed<bool>(() => super.isSendingCodeIn,
              name: '_ForgetPasswordFormStore.isSendingCodeIn'))
          .value;
  Computed<bool>? _$isChangingPasswordComputed;

  @override
  bool get isChangingPassword => (_$isChangingPasswordComputed ??=
          Computed<bool>(() => super.isChangingPassword,
              name: '_ForgetPasswordFormStore.isChangingPassword'))
      .value;

  late final _$emailAtom =
      Atom(name: '_ForgetPasswordFormStore.email', context: context);

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

  late final _$codeAtom =
      Atom(name: '_ForgetPasswordFormStore.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_ForgetPasswordFormStore.password', context: context);

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

  late final _$confirmPasswordAtom =
      Atom(name: '_ForgetPasswordFormStore.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$codeSentAtom =
      Atom(name: '_ForgetPasswordFormStore.codeSent', context: context);

  @override
  bool get codeSent {
    _$codeSentAtom.reportRead();
    return super.codeSent;
  }

  @override
  set codeSent(bool value) {
    _$codeSentAtom.reportWrite(value, super.codeSent, () {
      super.codeSent = value;
    });
  }

  late final _$sendingCodeAtom =
      Atom(name: '_ForgetPasswordFormStore.sendingCode', context: context);

  @override
  bool get sendingCode {
    _$sendingCodeAtom.reportRead();
    return super.sendingCode;
  }

  @override
  set sendingCode(bool value) {
    _$sendingCodeAtom.reportWrite(value, super.sendingCode, () {
      super.sendingCode = value;
    });
  }

  late final _$changingPasswordAtom =
      Atom(name: '_ForgetPasswordFormStore.changingPassword', context: context);

  @override
  bool get changingPassword {
    _$changingPasswordAtom.reportRead();
    return super.changingPassword;
  }

  @override
  set changingPassword(bool value) {
    _$changingPasswordAtom.reportWrite(value, super.changingPassword, () {
      super.changingPassword = value;
    });
  }

  late final _$passwordChangedAtom =
      Atom(name: '_ForgetPasswordFormStore.passwordChanged', context: context);

  @override
  bool get passwordChanged {
    _$passwordChangedAtom.reportRead();
    return super.passwordChanged;
  }

  @override
  set passwordChanged(bool value) {
    _$passwordChangedAtom.reportWrite(value, super.passwordChanged, () {
      super.passwordChanged = value;
    });
  }

  late final _$SendForgetPasswordCodeFutureAtom = Atom(
      name: '_ForgetPasswordFormStore.SendForgetPasswordCodeFuture',
      context: context);

  @override
  ObservableFuture<LoginResponseEntity?> get SendForgetPasswordCodeFuture {
    _$SendForgetPasswordCodeFutureAtom.reportRead();
    return super.SendForgetPasswordCodeFuture;
  }

  @override
  set SendForgetPasswordCodeFuture(
      ObservableFuture<LoginResponseEntity?> value) {
    _$SendForgetPasswordCodeFutureAtom
        .reportWrite(value, super.SendForgetPasswordCodeFuture, () {
      super.SendForgetPasswordCodeFuture = value;
    });
  }

  late final _$resetPasswordFutureAtom = Atom(
      name: '_ForgetPasswordFormStore.resetPasswordFuture', context: context);

  @override
  ObservableFuture<LoginResponseEntity?> get resetPasswordFuture {
    _$resetPasswordFutureAtom.reportRead();
    return super.resetPasswordFuture;
  }

  @override
  set resetPasswordFuture(ObservableFuture<LoginResponseEntity?> value) {
    _$resetPasswordFutureAtom.reportWrite(value, super.resetPasswordFuture, () {
      super.resetPasswordFuture = value;
    });
  }

  late final _$sendForgetPasswordCodeAsyncAction = AsyncAction(
      '_ForgetPasswordFormStore.sendForgetPasswordCode',
      context: context);

  @override
  Future<LoginResponseEntity?> sendForgetPasswordCode() {
    return _$sendForgetPasswordCodeAsyncAction
        .run(() => super.sendForgetPasswordCode());
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_ForgetPasswordFormStore.resetPassword', context: context);

  @override
  Future<LoginResponseEntity?> resetPassword() {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword());
  }

  late final _$_ForgetPasswordFormStoreActionController =
      ActionController(name: '_ForgetPasswordFormStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCode(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.validateCode');
    try {
      return super.validateCode(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_ForgetPasswordFormStoreActionController.startAction(
        name: '_ForgetPasswordFormStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_ForgetPasswordFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
code: ${code},
password: ${password},
confirmPassword: ${confirmPassword},
codeSent: ${codeSent},
sendingCode: ${sendingCode},
changingPassword: ${changingPassword},
passwordChanged: ${passwordChanged},
SendForgetPasswordCodeFuture: ${SendForgetPasswordCodeFuture},
resetPasswordFuture: ${resetPasswordFuture},
canSendForgetPasswordCode: ${canSendForgetPasswordCode},
canChangePassword: ${canChangePassword},
isSendingCodeIn: ${isSendingCodeIn},
isChangingPassword: ${isChangingPassword}
    ''';
  }
}

mixin _$ForgetPasswordFormErrorStore on _ForgetPasswordFormErrorStore, Store {
  late final _$userEmailErrorAtom = Atom(
      name: '_ForgetPasswordFormErrorStore.userEmailError', context: context);

  @override
  String? get userEmailError {
    _$userEmailErrorAtom.reportRead();
    return super.userEmailError;
  }

  @override
  set userEmailError(String? value) {
    _$userEmailErrorAtom.reportWrite(value, super.userEmailError, () {
      super.userEmailError = value;
    });
  }

  late final _$codeErrorAtom =
      Atom(name: '_ForgetPasswordFormErrorStore.codeError', context: context);

  @override
  String? get codeError {
    _$codeErrorAtom.reportRead();
    return super.codeError;
  }

  @override
  set codeError(String? value) {
    _$codeErrorAtom.reportWrite(value, super.codeError, () {
      super.codeError = value;
    });
  }

  late final _$passwordErrorAtom = Atom(
      name: '_ForgetPasswordFormErrorStore.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$confirmPasswordErrorAtom = Atom(
      name: '_ForgetPasswordFormErrorStore.confirmPasswordError',
      context: context);

  @override
  String? get confirmPasswordError {
    _$confirmPasswordErrorAtom.reportRead();
    return super.confirmPasswordError;
  }

  @override
  set confirmPasswordError(String? value) {
    _$confirmPasswordErrorAtom.reportWrite(value, super.confirmPasswordError,
        () {
      super.confirmPasswordError = value;
    });
  }

  @override
  String toString() {
    return '''
userEmailError: ${userEmailError},
codeError: ${codeError},
passwordError: ${passwordError},
confirmPasswordError: ${confirmPasswordError}
    ''';
  }
}
