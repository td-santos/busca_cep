import 'package:flutter/material.dart';
import 'package:teste_busca_cep/pages/search_cep_page/search_cep_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SearchCepPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(
         gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.indigo, Colors.indigo,Colors.blue]
         )
        ),
        child: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                   Icon(Icons.ads_click_rounded, color: Colors.white,size: 30,),
                   SizedBox(width: 10,),
                  Text(
                    'Busca Cep',
                    style: TextStyle(
                        fontSize: 40, 
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
