import 'dart:ffi';

import 'package:flutter/material.dart';

class Board extends StatelessWidget{

  List<List<String>> board;

  Board(this.board);

  @override

  Widget build(BuildContext context) {

    return GridView.count(

      padding: const EdgeInsets.all(10),
      crossAxisCount: 8,
      children: (){

        var home = <Widget>[];

        bool check = false;
        for(int i = 0 ; i < 8; i++) {
          for (int j = 0; j < 8; j++) {
            home.add( _home(check ? Colors.yellow[100] : Colors.brown, this.board[i][j]));
            check = !check;
          }
          check = !check;
        }

        return home;

      }(),

    );
  }
}

Widget _home(Color color, String peca) {
  return
    Container(
      padding: const EdgeInsets.all(4),
      color: color,
      child: peca != null ? Image.asset('assets/images/$peca.png') : null,
    );
}





