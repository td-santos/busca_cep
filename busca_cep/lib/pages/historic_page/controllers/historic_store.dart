// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_busca_cep/repositories/firebase_repository.dart';

import '../../../models/cep_model.dart';
part 'historic_store.g.dart';

class HistoricStore = _HistoricStoreBase with _$HistoricStore;

abstract class _HistoricStoreBase with Store {
  @observable
  List<CepModel> cepsHistoric = [];

  @observable
  bool load = false;

  @observable
  bool error = false;

  @observable
  String msg = '';

  @action
  Future<void> getHistoric()async{
    load = true;

    try {
      FirebaseRepository firebaseRepository = FirebaseRepository();
      cepsHistoric = List.from(await firebaseRepository.getHistoric());
      //throw Exception();
    } catch (e) {
      //print(e);
      load = false;
      error = true;
      msg = 'Falha ao buscar histórico';
    }finally{
      load = false;
    }
    
    load = false;
  }
}