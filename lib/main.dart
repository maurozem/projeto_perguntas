import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'qual sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'pontuacao': 10},
        {'texto': 'vermelho', 'pontuacao': 8},
        {'texto': 'verde', 'pontuacao': 6},
        {'texto': 'branco', 'pontuacao': 4},
      ]
    },
    {
      'texto': 'qual seu animal favorito?',
      'respostas': [
        {'texto': 'coelho', 'pontuacao': 5},
        {'texto': 'cobra', 'pontuacao': 7},
        {'texto': 'elefante', 'pontuacao': 9},
        {'texto': 'leão', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Mariane', 'pontuacao': 9},
        {'texto': 'João', 'pontuacao': 8},
        {'texto': 'José', 'pontuacao': 7},
        {'texto': 'Mauricio', 'pontuacao': 10},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
