import 'package:flutter/material.dart';

import 'configuracao_page.dart';

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
                                  fontSize: 125,
                                ),
                              ),
                            ),
                          ]),
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
                          ]),
                    ),
                    Card(
                      // color: widget.cor,
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
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: RaisedButton(
                        color: Colors.orange,
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
                              // Icon(
                              //   Icons.update,
                              //   color: Colors.white,
                              // ),
                            ]),
                        onPressed: () {
                          // Navigator.pushReplacementNamed(
                          //     context, RouteGeneretor.ROTA_HOME);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Text("Aqui ficara a regra da meta "),
                    ),
                  ],
                ),
              ),
            ),
            /*  RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              color: Colors.orange,
              child: Text(
                "Salvar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ), */
            /* Container(
              //height: 100,
              //color: Colors.orange,
              child: Text(
                "* Observação: As informações do aplicativos é apenas para conferencia para saber qual é realmente seu peso ideal é necessário consultar um médico. ",
              ),
            ) */
          ],
        ),
      ),
    );
  }
}
