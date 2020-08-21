
import 'package:flutter/material.dart';

class Leitor extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Card(child: widgetTextBox());
  }

  widgetTextBox(){
    return SizedBox.fromSize(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: (){
            RegExp exp = new RegExp(r"^(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\s(\w)+\s(\-|[KQkq]+)\s(\-|[\w]+)\s\d+\s\d+");
            String str = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
            var matches = exp.firstMatch(str);
            
            return matches.group(0);
          }(),
        ),
      )
    );
  }


}