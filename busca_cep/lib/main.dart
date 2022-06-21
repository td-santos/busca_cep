import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_busca_cep/pages/historic_page/controllers/historic_store.dart';
import 'package:teste_busca_cep/pages/search_cep_page/controllers/search_cep_store.dart';
import 'package:teste_busca_cep/pages/splash_page/splash_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  
  runApp(MultiProvider(
    providers: [
      Provider<SearchCepStore>(create: (_) => SearchCepStore()),
      Provider<HistoricStore>(create: (_) => HistoricStore()..getHistoric()),
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {    

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}

