import 'package:flutter/material.dart';
import 'package:imc/blocs/imc_bloc.dart';

class ResultadoPage extends StatefulWidget {
  @override
  _ResultadoPageState createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  var bloc = new ImcBloc();
  String resultado;

  @override
  void initState() {
    //resultado = bloc.calculate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(bloc.result),
          ],
        ),
      ),
    );
  }
}
