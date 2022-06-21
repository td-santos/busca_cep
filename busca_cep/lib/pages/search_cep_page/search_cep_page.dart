// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_busca_cep/pages/historic_page/historic_page.dart';
import 'package:teste_busca_cep/pages/search_cep_page/controllers/search_cep_store.dart';
import 'package:teste_busca_cep/pages/search_cep_page/widgets/cep_info.dart';


class SearchCepPage extends StatefulWidget {
  const SearchCepPage({Key? key}) : super(key: key);

  @override
  State<SearchCepPage> createState() => _SearchCepPageState();
}

class _SearchCepPageState extends State<SearchCepPage> {
  final _controllerCep = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    final _searchCepStore = Provider.of<SearchCepStore>(context);

    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisa Cep'),
        backgroundColor: Colors.indigo,
        elevation: 0.5,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>const HistoricPage()));
            }, 
            icon: const Icon(Icons.history, color: Colors.orange,))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.indigo, Colors.indigo, Colors.blue])),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 2,
                  child: Observer(builder: (_) {
                    if (_searchCepStore.load) {
                      return const LinearProgressIndicator();
                    }
                    return Container();
                  })),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controllerCep,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                          decoration: const InputDecoration(
                              label: Text('Cep'),
                              hintText: 'informe o cep',
                              border: InputBorder.none),
                              
                          onFieldSubmitted: (text){
                            _searchCepStore.buscacep(_controllerCep.text);
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: (){
                            _searchCepStore.buscacep(_controllerCep.text);
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.orange,
                            size: 25,
                          ))
                    ],
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    _searchCepStore.msg,
                    style: TextStyle(color: Colors.red[400], letterSpacing: 1),
                  ),
                );
              }),
              Observer(builder: (_) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Center(child: CepInfo()),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
