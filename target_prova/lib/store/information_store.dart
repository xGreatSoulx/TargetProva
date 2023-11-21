// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'information_store.g.dart';

class InformationStore = _InformationStore with _$InformationStore;

abstract class _InformationStore with Store {
  int? _index;

  @observable
  String currentInformation = '';

  ObservableList<String> informations = ObservableList<String>();

  @action
  void addInformation() {
    if (_index != null) {
      informations[_index!] = currentInformation;
    } else {
      informations.add(currentInformation);
    }

    currentInformation = '';
    _index = null;
  }

  @action
  void removeInformation(int index) => informations.removeAt(index);

  @action
  void editInformation(int index) {
    currentInformation = informations[index];
    _index = index;
  }

  @action
  void setCurrentInformation(String value) => currentInformation = value;
}
