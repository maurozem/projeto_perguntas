import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print("\n pergunta respondida ");
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'qual sua cor favorita?',
        'respostas': ['preto', 'vermelho', 'verde', 'branco']
      },
      {
        'texto': 'qual seu animal favorito?',
        'respostas': ['coelho', 'cobra', 'elefante', 'leão']
      },
      {
        'texto': 'qual seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Pedro', 'Mauricio']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto']),
            Resposta('resposta 01', _responder),
            Resposta('resposta 02', _responder),
            Resposta('resposta 03', _responder)
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
