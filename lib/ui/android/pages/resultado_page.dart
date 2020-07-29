import 'package:flutter/material.dart';

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
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      widget.mensagem,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    Center(
                      child: Card(
                        color: widget.cor,
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "${widget.resultado}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 150,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "${widget.pesoIdeal}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${widget.formulaLorentz}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
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
            Container(
              //height: 100,
              //color: Colors.orange,
              child: Text(
                "* Observação: As informações do aplicativos é apenas para conferencia para saber qual é realmente seu peso ideal é necessário consultar um médico. ",
              ),
            )
          ],
        ),
      ),
    );
  }
}
