import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teste_busca_cep/models/cep_model.dart';

class FirebaseRepository {
  
  var historic = FirebaseFirestore.instance.collection('historic');

  Future addFirebaseHistoric(CepModel cepModel) async {
    
    historic.add({
      'cep': cepModel.cep,
      'cidade': cepModel.cidade,
      'bairro': cepModel.bairro,
      'rua': cepModel.rua,
    });
  }

  Future<List<CepModel>> getHistoric() async {
    List<CepModel> cepsHist = [];

    var result = await historic.get();

    for (var cep in result.docs) {
      cepsHist.add(CepModel(
          cep: cep['cep'],
          cidade: cep['cidade'],
          bairro: cep['bairro'],
          rua: cep['rua']));
    }

    return cepsHist;
  }
}
