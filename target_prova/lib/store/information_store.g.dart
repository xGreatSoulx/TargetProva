// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InformationStore on _InformationStore, Store {
  late final _$hashCodeCurrentInformationAtom = Atom(
      name: '_InformationStore.hashCodeCurrentInformation', context: context);

  @override
  int? get hashCodeCurrentInformation {
    _$hashCodeCurrentInformationAtom.reportRead();
    return super.hashCodeCurrentInformation;
  }

  @override
  set hashCodeCurrentInformation(int? value) {
    _$hashCodeCurrentInformationAtom
        .reportWrite(value, super.hashCodeCurrentInformation, () {
      super.hashCodeCurrentInformation = value;
    });
  }

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

  late final _$informationsAtom =
      Atom(name: '_InformationStore.informations', context: context);

  @override
  List<String> get informations {
    _$informationsAtom.reportRead();
    return super.informations;
  }

  @override
  set informations(List<String> value) {
    _$informationsAtom.reportWrite(value, super.informations, () {
      super.informations = value;
    });
  }

  late final _$_InformationStoreActionController =
      ActionController(name: '_InformationStore', context: context);

  @override
  void addInformation(String information, int? hashCode) {
    final _$actionInfo = _$_InformationStoreActionController.startAction(
        name: '_InformationStore.addInformation');
    try {
      return super.addInformation(information, hashCode);
    } finally {
      _$_InformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInformation(int hashcode) {
    final _$actionInfo = _$_InformationStoreActionController.startAction(
        name: '_InformationStore.removeInformation');
    try {
      return super.removeInformation(hashcode);
    } finally {
      _$_InformationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hashCodeCurrentInformation: ${hashCodeCurrentInformation},
currentInformation: ${currentInformation},
informations: ${informations}
    ''';
  }
}
