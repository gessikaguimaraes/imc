import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc/blocs/imc_bloc.dart';
import 'package:imc/ui/android/pages/resultado_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();
  FocusNode focusNodeAltura;
  FocusNode focusNodePeso;

  @override
  void initState() {
    super.initState();
    focusNodeAltura = FocusNode();
    focusNodePeso = FocusNode();
  }

  @override
  void dispose() {
    focusNodeAltura.dispose();
    focusNodePeso.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        backgroundColor: Colors.orange,
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
              child: RaisedButton(
                onPressed: () {
                  bloc.calculate();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultadoPage(
                        mensagem: bloc.mensagem,
                        resultado: bloc.resultado,
                        cor: bloc.cor,
                      ),
                    ),
                  );
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
