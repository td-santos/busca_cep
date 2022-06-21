// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_busca_cep/pages/search_cep_page/widgets/cep_info_item.dart';

import '../controllers/search_cep_store.dart';

class CepInfo extends StatefulWidget {
  const CepInfo({Key? key}) : super(key: key);

  @override
  State<CepInfo> createState() => _CepInfoState();
}

class _CepInfoState extends State<CepInfo> {
  @override
  Widget build(BuildContext context) {
    final _searchCepStore = Provider.of<SearchCepStore>(context);

    return Observer(builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CepInfoItem(
            title: 'Rua',
            text: _searchCepStore.rua,
            colorBacGround: Colors.black.withOpacity(.4),
          ),
          CepInfoItem(
            title: 'Bairro',
            text: _searchCepStore.bairro,
            colorBacGround: Colors.black.withOpacity(.4),
          ),
          CepInfoItem(
            title: 'Cidade',
            text: _searchCepStore.cidade,
            colorBacGround: Colors.black.withOpacity(.4),
          ),
          CepInfoItem(
            title: 'Cep',
            text: _searchCepStore.cep,
            colorBacGround: Colors.black.withOpacity(.4),
          ),
        ],
      );
    });
  }
}
