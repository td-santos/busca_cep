import 'package:dio/dio.dart';
import 'package:teste_busca_cep/models/cep_model.dart';

class ViaCep{

  final _dio = Dio();

  Future<CepModel> searchViaCep(String cep)async{
    //print('VIA CEP API');
    String url = 'https://viacep.com.br/ws/$cep/json/';

    try {
      final response  = await _dio.get(url);
      Map<String, dynamic> map = response.data;
      CepModel cepModel = CepModel(
        cep: map['cep'], 
        cidade: map['localidade'], 
        bairro: map['bairro'], 
        rua: map['logradouro']
        );
        

      return cepModel;
    } catch (e) {
      //print(e);
      throw Exception();
    }
  }
}