import 'package:mobx/mobx.dart';

part 'information_store.g.dart';

class InformationStore = _InformationStore with _$InformationStore;

abstract class _InformationStore with Store {
  @observable
  int? hashCodeCurrentInformation;

  @observable
  String currentInformation = '';

  @observable
  List<String> informations = [
    'INFO1',
    'INFO2',
    'INFO3',
    'INFO4',
  ];

  @action
  void addInformation(String information, int? hashCode) {
    if (hashCodeCurrentInformation != null) {
      informations = informations.map((information) {
        if (information.hashCode == hashCodeCurrentInformation) {
          return currentInformation;
        }
        return information;
      }).toList();
    } else {
      informations.add(currentInformation);
    }

    currentInformation = '';
    hashCodeCurrentInformation = null;
  }

  @action
  void removeInformation(int hashcode) {
    informations.removeWhere((e) => e.hashCode == hashCode);
  }
}
