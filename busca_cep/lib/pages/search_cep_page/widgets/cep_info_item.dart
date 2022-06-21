
import 'package:flutter/material.dart';


class CepInfoItem extends StatelessWidget {

  final String title;
  final String text;
  final Color colorBacGround;
  const CepInfoItem({Key? key, required this.title, required this.text, required this.colorBacGround }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: colorBacGround
      ),
      child: Row(
        
        children: [
          Text('$title : ', style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 25
            ),),
          Text(text, style:const  TextStyle(
            fontSize: 17,
            color: Colors.white
          ),)
        ],
      ),
    );
  }
}