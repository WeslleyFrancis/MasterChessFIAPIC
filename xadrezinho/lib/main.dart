import 'package:flutter/material.dart';
import 'package:xadrezinho/screens/Board.dart';

void main() => runApp(new MasterChessBoard());

class MasterChessBoard extends StatefulWidget {

  @override
  _MasterChessBoardState createState() => _MasterChessBoardState();
}

class _MasterChessBoardState extends State<MasterChessBoard> {

  final myController = TextEditingController();

  List<List<String>> myBoard;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.text =  "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
    myBoard = [
      ['rook','knight','bishop','queen','king','bishop','knight','rook'],
      ['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
      [null,null,null,null,null,null,null,null],
      [null,null,null,null,null,null,null,null],
      [null,null,null,null,null,null,null,null],
      [null,null,null,null,null,null,null,null],
      ['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
      ['rook','knight','bishop','queen','king','bishop','knight','rook'],
    ];
  }

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
              child: Board(myBoard),
            ),

            Container(
               child: Card(
                 child: widgetTextBox(),
               ),
              )
          ]
         ),


        floatingActionButton: FloatingActionButton(
          onPressed: (){
            RegExp exp = new RegExp(r"^(\w+(?:\/\w+){7})\s(\w)+\s(\-|[KQkq]+)\s(\-|[\w]+)\s\d+\s\d+");
            String str = myController.text;
            var match = exp.firstMatch(str);

            var exp2 = RegExp(r"(\w+)");

            var matches = exp2.allMatches(match.group(1)).toList();

            var list = new List<List<String>>();

            for(var i = 0; i < matches.length; i++){
              var group = matches[i].group(1);
              var l = new List<String>();

              for(var j = 0; j < group.length; j++){
                var check = group[j];
                switch(check)
                {
                  case "8":
                  case "7":
                  case "6":
                  case "5":
                  case "4":
                  case "3":
                  case "2":
                  case "1":
                    var d = int.parse(check);
                    for(var k = 0; k < d; k++){
                      l.add(null);
                    }
                    break;
                  case "Q":
                  case "q":
                    l.add("queen");
                    break;
                  case "K":
                  case "k":
                    l.add("king");
                    break;
                  case "N":
                  case "n":
                    l.add("knight");
                    break;
                  case "R":
                  case "r":
                    l.add("rook");
                    break;
                  case "B":
                  case "b":
                    l.add("bishop");
                    break;
                  case "P":
                  case "p":
                    l.add("pawn");
                    break;
                }
              }
              list.add(l);
            }
            setState(() {
              myBoard = list;
            });
          },
        ),
        ),
      );

  }

  widgetTextBox(){
    return SizedBox.fromSize(
        child: TextField(
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Text"
          ),
          controller: myController,
        )
    );
  }
}
