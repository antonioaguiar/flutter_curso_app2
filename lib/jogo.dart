import 'dart:math';

import 'package:flutter/material.dart';

class JokenPo extends StatefulWidget {
  @override
  _JokenPoState createState() => _JokenPoState();
}

class _JokenPoState extends State<JokenPo> {
  List imagens = [
    "images/padrao.png",
    "images/pedra.png",
    "images/papel.png",
    "images/tesoura.png"
  ];
  List jogada = ["","Pedra", "Papel", "Tesoura"];
  int _resultado = 0;

  final pedra = 1;
  final papel = 2;
  final tesoura = 3;

  int _jogo = 0;
  String _vencedor = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Joken PO"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(imagens[_jogo], height: 120),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha uma opção abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _jogo = jogar();
                      _resultado =  avaliarJogada(pedra, _jogo);
                      _vencedor = jogada[_resultado];
                    });
                  },
                  child: Image.asset("images/pedra.png", height: 95),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _jogo = jogar();
                      _resultado =  avaliarJogada(papel, _jogo);
                      _vencedor = jogada[_resultado];
                    });
                  },
                  child: Image.asset("images/papel.png", height: 95),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _jogo = jogar();
                      _resultado =  avaliarJogada(tesoura, _jogo);
                      _vencedor = jogada[_resultado];                      
                    });
                  },
                  child: Image.asset("images/tesoura.png", height: 95),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "$_vencedor",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int jogar() {
    int _jogo = Random().nextInt(3) + 1;
    print(_jogo);
    return _jogo;
  }

  int avaliarJogada(int j1, int j2) {
    print('j1: $j1, j1: $j2');
    // 1 pedra     3 tesoura  = 1
    // 1 pedra     2 papel    = 2
    // 2 papel     1 pedra    = 2
    // 2 papel     3 tesoura  = 3
    // 3 tesoura   1 pedra    = 1
    // 3 tesoura   2 pepal    = 3
    int res = 0;
    if (j1 == 1 && j2 == 3) {
      res = 1;
    }
    if (j1 == 1 && j2 == 2) {
      res = 2;
    }
    if (j1 == 2 && j2 == 1) {
      res = 2;
    }
    if (j1 == 2 && j2 == 3) {
      res = 3;
    }
    if (j1 == 3 && j2 == 1) {
      res = 1;
    }
    if (j1 == 3 && j2 == 2) {
      res = 3;
    }

    print(jogada[res]); 

    return res;
  }
}
