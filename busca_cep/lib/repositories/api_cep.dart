import 'package:dio/dio.dart';
import 'package:teste_busca_cep/models/cep_model.dart';

class ApiCep{

  final _dio = Dio();

  Future<CepModel> searchApiCep(String cep)async{
    //print('APICEP API');
    String url = 'https://ws.apicep.com/cep/$cep.json';

    try {
      final response  = await _dio.get(url);
      Map<String, dynamic> map = response.data;
      CepModel cepModel = CepModel(
        cep: map['code'], 
        cidade: map['city'], 
        bairro: map['district'], 
        rua: map['address']
        );
        
        

      return cepModel;
    } catch (e) {
      //print(e);
      throw Exception();
    }
  }
}