import 'package:flutter/material.dart';
import 'package:xadrezinho/screens/Board.dart';
import 'package:xadrezinho/screens/Leitor.dart';

void main() => runApp(new MasterChessBoard());

class MasterChessBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown,
          title: Text('Master Chess',
              style: TextStyle(fontSize: 24.0, color: Colors.white)),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 400,
              child: Board([
                ['rook','knight','bishop','queen','king','bishop','knight','rook'],
                ['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
                [null,null,null,null,null,null,null,null],
                [null,null,null,null,null,null,null,null],
                [null,null,null,null,null,null,null,null],
                [null,null,null,null,null,null,null,null],
                ['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
                ['rook','knight','bishop','queen','king','bishop','knight','rook'],
              ]),
            ),
            Container(
              child: Leitor()
              )
          ]
         ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
        ),
        ),
      );
  }
}


//Board([
//['rook','knight','bishop','queen','king','bishop','knight','rook'],
//['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
//[null,null,null,null,null,null,null,null],
//[null,null,null,null,null,null,null,null],
//[null,null,null,null,null,null,null,null],
//[null,null,null,null,null,null,null,null],
//['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
//['rook','knight','bishop','queen','king','bishop','knight','rook'],
//])

//^(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\/(\w+)\s(\w)+\s(\-|[KQkq]+)\s(\-|[\w]+)\s\d+\s\d+