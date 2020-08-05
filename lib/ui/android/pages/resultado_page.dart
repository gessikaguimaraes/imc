import 'package:flutter/material.dart';
import 'package:imc/ui/android/pages/sexo_page.dart';
import 'package:imc/ui/services/admob_service.dart';

class ResultadoPage extends StatefulWidget {
  final String mensagem;
  final String resultado;
  final Color cor;
  final String pesoIdeal;
  final String formulaLorentz;

  const ResultadoPage(
      {Key key,
      this.mensagem,
      this.resultado,
      this.cor,
      this.pesoIdeal,
      this.formulaLorentz})
      : super(key: key);

  @override
  _ResultadoPageState createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: Colors.orange[700],
        automaticallyImplyLeading: false,
        actions: <Widget>[],
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Colors.blue[700],
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                widget.mensagem,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Card(
                      color: widget.cor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            // leading: Icon(
                            //   Icons.directions_car,
                            //   color: Colors.red,
                            // ),
                            title: Text(
                              "${widget.resultado}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      // color: widget.cor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.fitness_center,
                              color: Colors.orange[700],
                            ),
                            title: Text(
                              "Peso ideal",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              "${widget.pesoIdeal}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            trailing: FittedBox(
                              fit: BoxFit.fill,
                            ),
                            leading: Icon(
                              Icons.functions,
                              color: Colors.orange[700],
                            ),
                            title: Text(
                              "Fórmula de Lorentz",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              "${widget.formulaLorentz}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: RaisedButton(
                        color: Colors.orange[700],
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Calcular Novamente",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          AdMobService().mostrarInterstitial(context);
                          // Navigator.pushReplacementNamed(
                          //     context, RouteGeneretor.ROTA_HOME);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
