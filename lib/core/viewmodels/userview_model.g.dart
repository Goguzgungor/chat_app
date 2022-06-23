// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userview_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserViewModel on _UserViewModelBase, Store {
  late final _$userListAtom =
      Atom(name: '_UserViewModelBase.userList', context: context);

  @override
  ObservableList<dynamic> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableList<dynamic> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$_UserViewModelBaseActionController =
      ActionController(name: '_UserViewModelBase', context: context);

  @override
  void getData() {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.getData');
    try {
      return super.getData();
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
