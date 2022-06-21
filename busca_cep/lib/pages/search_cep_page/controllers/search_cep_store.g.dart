// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_cep_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchCepStore on _SearchCepStoreBase, Store {
  late final _$msgAtom =
      Atom(name: '_SearchCepStoreBase.msg', context: context);

  @override
  String get msg {
    _$msgAtom.reportRead();
    return super.msg;
  }

  @override
  set msg(String value) {
    _$msgAtom.reportWrite(value, super.msg, () {
      super.msg = value;
    });
  }

  late final _$ruaAtom =
      Atom(name: '_SearchCepStoreBase.rua', context: context);

  @override
  String get rua {
    _$ruaAtom.reportRead();
    return super.rua;
  }

  @override
  set rua(String value) {
    _$ruaAtom.reportWrite(value, super.rua, () {
      super.rua = value;
    });
  }

  late final _$cidadeAtom =
      Atom(name: '_SearchCepStoreBase.cidade', context: context);

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  late final _$bairroAtom =
      Atom(name: '_SearchCepStoreBase.bairro', context: context);

  @override
  String get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(String value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  late final _$cepAtom =
      Atom(name: '_SearchCepStoreBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$loadAtom =
      Atom(name: '_SearchCepStoreBase.load', context: context);

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  late final _$buscacepAsyncAction =
      AsyncAction('_SearchCepStoreBase.buscacep', context: context);

  @override
  Future<bool> buscacep(String cep) {
    return _$buscacepAsyncAction.run(() => super.buscacep(cep));
  }

  late final _$_SearchCepStoreBaseActionController =
      ActionController(name: '_SearchCepStoreBase', context: context);

  @override
  bool validaCepField(String text) {
    final _$actionInfo = _$_SearchCepStoreBaseActionController.startAction(
        name: '_SearchCepStoreBase.validaCepField');
    try {
      return super.validaCepField(text);
    } finally {
      _$_SearchCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
msg: ${msg},
rua: ${rua},
cidade: ${cidade},
bairro: ${bairro},
cep: ${cep},
load: ${load}
    ''';
  }
}
