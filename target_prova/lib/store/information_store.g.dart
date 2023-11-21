// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationStore on _InformationStore, Store {
  late final _$currentInformationAtom =
      Atom(name: '_InformationStore.currentInformation', context: context);

  @override
  String get currentInformation {
    _$currentInformationAtom.reportRead();
    return super.currentInformation;
  }

  @override
  set currentInformation(String value) {
    _$currentInformationAtom.reportWrite(value, super.currentInformation, () {
      super.currentInformation = value;
    });
  }

  late final _$_InformationStoreActionController =
      ActionController(name: '_InformationStore', context: context);

  @override
  void addInformation() {
    final _$actionInfo = _$_InformationStoreActionController.startAction(
        name: '_InformationStore.addInformation');
    try {
      return super.addInformation();
    } finally {
      _$_InformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInformation(int index) {
    final _$actionInfo = _$_InformationStoreActionController.startAction(
        name: '_InformationStore.removeInformation');
    try {
      return super.removeInformation(index);
    } finally {
      _$_InformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editInformation(int index) {
    final _$actionInfo = _$_InformationStoreActionController.startAction(
        name: '_InformationStore.editInformation');
    try {
      return super.editInformation(index);
    } finally {
      _$_InformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentInformation(String value) {
    final _$actionInfo = _$_InformationStoreActionController.startAction(
        name: '_InformationStore.setCurrentInformation');
    try {
      return super.setCurrentInformation(value);
    } finally {
      _$_InformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentInformation: ${currentInformation}
    ''';
  }
}
