// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:teste_busca_cep/models/cep_model.dart';
import 'package:teste_busca_cep/repositories/api_cep.dart';
import 'package:teste_busca_cep/repositories/awesome_api_cep.dart';
import 'package:teste_busca_cep/repositories/firebase_repository.dart';
import 'package:teste_busca_cep/repositories/via_cep.dart';
part 'search_cep_store.g.dart';

class SearchCepStore = _SearchCepStoreBase with _$SearchCepStore;

abstract class _SearchCepStoreBase with Store {
  @observable
  String msg = '';

  @observable
  String rua = '';

  @observable
  String cidade = '';

  @observable
  String bairro = '';

  @observable
  String cep = '';

  @observable
  bool load = false;

  @action
  bool validaCepField(String text){
    msg = '';
    late bool isValid ;
    if(text.isEmpty ){
      msg = 'Campo obrigatório';
      isValid = false;
    }else if(text.length != 8){
      msg = 'Informe 8 números';
      isValid = false;
    }else{
      isValid = true;
    }

    return isValid;

  }

  @action
  Future<bool> buscacep(String cep) async {
    if(!validaCepField(cep)){
      return false;
    }
    
    late CepModel cepModel;
    FirebaseRepository firebaseRepository = FirebaseRepository();
    try {
      load = true;
      ViaCep viaCep = ViaCep();
      cepModel = await viaCep.searchViaCep(cep);
      firebaseRepository = FirebaseRepository();
      await firebaseRepository.addFirebaseHistoric(cepModel);
      //msg = 'via cep';
    } catch (e) {
      try {
        AwesomeApiCep awesomeApiCep = AwesomeApiCep();
        cepModel = await awesomeApiCep.searchAwesomeCep(cep);
        //msg = 'awesome';
        firebaseRepository = FirebaseRepository();
        await firebaseRepository.addFirebaseHistoric(cepModel);
      } catch (e) {
        try {
          ApiCep apicep = ApiCep();
          cepModel = await apicep.searchApiCep(cep);
          firebaseRepository = FirebaseRepository();
          await firebaseRepository.addFirebaseHistoric(cepModel);
          //msg = 'ApiCep';
        } catch (e) {
          msg = 'nao foi possível encontrar o cep, tente mais tarde';
          rua = '';
          cidade = '';
          bairro = '';
          this.cep = '';
          return false;
        }
      }
    } finally {
      load = false;
    }

    rua = cepModel.rua;
    cidade = cepModel.cidade;
    this.cep = cepModel.cep;
    bairro = cepModel.bairro;
    load = false;
    return true;
  }
}
