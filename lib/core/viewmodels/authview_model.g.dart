// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authview_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on _AuthViewModelBase, Store {
  late final _$textCol2Atom =
      Atom(name: '_AuthViewModelBase.textCol2', context: context);

  @override
  Color get textCol2 {
    _$textCol2Atom.reportRead();
    return super.textCol2;
  }

  @override
  set textCol2(Color value) {
    _$textCol2Atom.reportWrite(value, super.textCol2, () {
      super.textCol2 = value;
    });
  }

  late final _$textCol1Atom =
      Atom(name: '_AuthViewModelBase.textCol1', context: context);

  @override
  Color get textCol1 {
    _$textCol1Atom.reportRead();
    return super.textCol1;
  }

  @override
  set textCol1(Color value) {
    _$textCol1Atom.reportWrite(value, super.textCol1, () {
      super.textCol1 = value;
    });
  }

  late final _$authTypeAtom =
      Atom(name: '_AuthViewModelBase.authType', context: context);

  @override
  String get authType {
    _$authTypeAtom.reportRead();
    return super.authType;
  }

  @override
  set authType(String value) {
    _$authTypeAtom.reportWrite(value, super.authType, () {
      super.authType = value;
    });
  }

  late final _$authFoncAsyncAction =
      AsyncAction('_AuthViewModelBase.authFonc', context: context);

  @override
  Future authFonc(String mail, String pass, String name, BuildContext context) {
    return _$authFoncAsyncAction
        .run(() => super.authFonc(mail, pass, name, context));
  }

  late final _$_AuthViewModelBaseActionController =
      ActionController(name: '_AuthViewModelBase', context: context);

  @override
  dynamic changeType() {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
        name: '_AuthViewModelBase.changeType');
    try {
      return super.changeType();
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isVisible(String Authtype) {
    final _$actionInfo = _$_AuthViewModelBaseActionController.startAction(
        name: '_AuthViewModelBase.isVisible');
    try {
      return super.isVisible(Authtype);
    } finally {
      _$_AuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textCol2: ${textCol2},
textCol1: ${textCol1},
authType: ${authType}
    ''';
  }
}
