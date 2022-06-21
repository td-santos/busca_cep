import 'package:dio/dio.dart';
import 'package:teste_busca_cep/models/cep_model.dart';

class AwesomeApiCep{

  final _dio = Dio();


  Future<CepModel> searchAwesomeCep(String cep)async{
    //print('AWESOME API');
    String url = 'https://cep.awesomeapi.com.br/json/$cep';

    try {
      final response  = await _dio.get(url);
      Map<String, dynamic> map = response.data;
      CepModel cepModel = CepModel(
        cep: map['cep'], 
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