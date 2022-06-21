// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoricStore on _HistoricStoreBase, Store {
  late final _$cepsHistoricAtom =
      Atom(name: '_HistoricStoreBase.cepsHistoric', context: context);

  @override
  List<CepModel> get cepsHistoric {
    _$cepsHistoricAtom.reportRead();
    return super.cepsHistoric;
  }

  @override
  set cepsHistoric(List<CepModel> value) {
    _$cepsHistoricAtom.reportWrite(value, super.cepsHistoric, () {
      super.cepsHistoric = value;
    });
  }

  late final _$loadAtom =
      Atom(name: '_HistoricStoreBase.load', context: context);

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

  late final _$errorAtom =
      Atom(name: '_HistoricStoreBase.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$msgAtom = Atom(name: '_HistoricStoreBase.msg', context: context);

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

  late final _$getHistoricAsyncAction =
      AsyncAction('_HistoricStoreBase.getHistoric', context: context);

  @override
  Future<void> getHistoric() {
    return _$getHistoricAsyncAction.run(() => super.getHistoric());
  }

  @override
  String toString() {
    return '''
cepsHistoric: ${cepsHistoric},
load: ${load},
error: ${error},
msg: ${msg}
    ''';
  }
}
