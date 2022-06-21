// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_busca_cep/pages/historic_page/controllers/historic_store.dart';
import 'package:teste_busca_cep/pages/search_cep_page/widgets/cep_info_item.dart';


class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    final _historicStore = Provider.of<HistoricStore>(context);
    _historicStore.getHistoric();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Histórico'),
          backgroundColor: Colors.indigo,
          elevation: 0.5,
        ),
        body: Observer(
          builder: (_) {
            if(_historicStore.load){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(_historicStore.error){
              return Center(child: Text(_historicStore.msg,style: TextStyle(color: Colors.red[400], fontSize: 18, ),),);
            }
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 0.7),
              //color: Colors.grey,
              child: ListView(
                children: _historicStore.cepsHistoric
                    .map((cepModel) => Container(
                          margin: const EdgeInsets.only(bottom: 0.8),
                          child: ExpansionTile(
                            title: Text(cepModel.cep),
                            textColor: Colors.white,
                            backgroundColor: Colors.indigo,
                            children: [
                              CepInfoItem(
                                title: 'Rua',
                                text: cepModel.rua,
                                colorBacGround: Colors.transparent,
                              ),
                              CepInfoItem(
                                title: 'Bairro',
                                text: cepModel.bairro,
                                colorBacGround: Colors.transparent,
                              ),
                              CepInfoItem(
                                title: 'Cidade',
                                text: cepModel.cidade,
                                colorBacGround: Colors.transparent,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            );
          },
        ));
  }
}
