import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc/blocs/imc_bloc.dart';
import 'package:imc/ui/android/pages/resultado_page.dart';

import 'configuracao_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var bloc = new ImcBloc();
  FocusNode focusNodeAltura;
  FocusNode focusNodePeso;
  FocusNode focusNodeIdade;

  @override
  void initState() {
    super.initState();
    focusNodeAltura = FocusNode();
    focusNodePeso = FocusNode();
    focusNodeIdade = FocusNode();
  }

  @override
  void dispose() {
    focusNodeAltura.dispose();
    focusNodePeso.dispose();
    focusNodeIdade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => ConfiguracaoPage(),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                focusNode: focusNodeAltura,
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(focusNodeAltura);
                  });
                },
                controller: bloc.heightCtrl,
                decoration: InputDecoration(
                  //floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(
                    color: focusNodeAltura.hasFocus
                        ? Colors.orange
                        : Colors.black38,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.orange,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                focusNode: focusNodePeso,
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(focusNodePeso);
                  });
                },
                controller: bloc.weightCtrl,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(
                    color:
                        focusNodePeso.hasFocus ? Colors.orange : Colors.black38,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.orange,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                focusNode: focusNodeIdade,
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(focusNodeIdade);
                  });
                },
                controller: bloc.idade,
                decoration: InputDecoration(
                  labelText: "Idade (anos)",
                  labelStyle: TextStyle(
                    color: focusNodeIdade.hasFocus
                        ? Colors.orange
                        : Colors.black38,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.orange,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () {
                  if (bloc.heightCtrl.text == "") {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("Informe a altura"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  } else if (bloc.weightCtrl.text == "") {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("Informe o peso"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  } else {
                    bloc.calculate();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultadoPage(
                          mensagem: bloc.mensagem,
                          resultado: bloc.resultado,
                          cor: bloc.cor,
                          pesoIdeal: bloc.pesoIdeal,
                        ),
                      ),
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                color: Colors.orange,
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
