import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc/blocs/imc_bloc.dart';
import 'package:imc/ui/android/pages/resultado_page.dart';
import 'package:imc/ui/services/admob_service.dart';

class HomePage extends StatefulWidget {
  final String sexo;

  const HomePage({Key key, this.sexo}) : super(key: key);

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
    AdMobService().mostrarBanner();
    focusNodeAltura = FocusNode();
    focusNodePeso = FocusNode();
    focusNodeIdade = FocusNode();
  }

  @override
  void dispose() {
    AdMobService().bannerAd.dispose();
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
        backgroundColor: Colors.orange[700],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
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
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(
                      color: focusNodeAltura.hasFocus
                          ? Colors.orange[700]
                          : Colors.black38,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.orange[700]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.orange[700],
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
                      color: focusNodePeso.hasFocus
                          ? Colors.orange[700]
                          : Colors.black38,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.orange[700]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.orange[700],
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
                          ? Colors.orange[700]
                          : Colors.black38,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.orange[700]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.orange[700],
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  if (bloc.heightCtrl.text == "") {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("Informe a altura"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.orange[700],
                      ),
                    );
                  } else if (bloc.weightCtrl.text == "") {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("Informe o peso"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.orange[700],
                      ),
                    );
                  } else if (bloc.idade.text == "") {
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text("Informe a idade"),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.orange[700],
                      ),
                    );
                  } else {
                    bloc.calculate(widget.sexo);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultadoPage(
                          mensagem: bloc.mensagem,
                          resultado: bloc.resultado,
                          cor: bloc.cor,
                          pesoIdeal: bloc.pesoIdeal,
                          formulaLorentz: bloc.formulaLorentz,
                        ),
                      ),
                    );
                  }
                },
                backgroundColor: Colors.orange[700],
                label: Text('Calcular'),
                elevation: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
