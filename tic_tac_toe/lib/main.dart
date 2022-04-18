import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Tic Tac Toe',
            style: TextStyle(
              fontSize: 40.0,
            ),),
        ),
        body: Game(),
      ),
    );
  }
}


class Game extends StatefulWidget {

  @override
  _State createState() => _State();
}
var _matrix= [
  ["", "" , ""],
  ["", "" , ""],
  ["", "" , ""]
];
class _State extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle ,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              _buildElement(0,0),
              _buildElement(0,1),
              _buildElement(0,2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              _buildElement(1,0),
              _buildElement(1,1),
              _buildElement(1,2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              _buildElement(2,0),
              _buildElement(2,1),
              _buildElement(2,2),
            ],
          ),
        ],
      ),
    );
  }

String _char= "X";
  Container _buildElement(int row , int col){
    return Container(
      width: 130,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black) ),

      child: FlatButton(
        onPressed: (){
          if(_matrix[row][col].isEmpty) {
            setState( (){
              _matrix[row][col]= _char;
              _char =_char == "X"?"O":"X";
              CheckWinner(row, col);
            });
          }
        },
        child:   Text("${_matrix[row][col]}",style: const TextStyle(fontSize: 60), ),
      ),
    );
  }
  CheckWinner(int x, int y) {
    var col = 0,
        row = 0,
        diag = 0,
        rdiag = 0;
    var n = _matrix.length - 1;
    var player = _matrix[x][y];

    for (int i = 0; i < _matrix.length; i++) {
      if (_matrix[x][i] == player)
        col++;
      if (_matrix[i][y] == player)
        row++;
      if (_matrix[i][i] == player)
        diag++;
      if (_matrix[i][n - i] == player)
        rdiag++;
    }
    if (row == n + 1 || col == n + 1 || diag == n + 1 || rdiag == n + 1) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
        title: const Text("Winner"),
        content: Text("$player Won"),
      ),
      );
      _matrix= [
        ["", "" , ""],
        ["", "" , ""],
        ["", "" , ""]
      ];
    }
    }
  }

