import 'package:flutter/material.dart';
import 'package:imc/ui/android/pages/home_page.dart';

import 'configuracao_page.dart';

class SexoPage extends StatefulWidget {
  @override
  _SexoPageState createState() => _SexoPageState();
}

class _SexoPageState extends State<SexoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool selectedHomem = false;
  bool selectedMulher = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Selecione o sexo"),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: size.height / 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!selectedMulher) {
                          selectedHomem = !selectedHomem;
                        }
                      });
                    },
                    child: Center(
                      child: AnimatedContainer(
                        color:
                            selectedHomem ? Colors.orange[700] : Colors.white,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: Image.asset(
                          "images/homem.png",
                          semanticLabel: "Homem",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height / 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!selectedHomem) {
                          selectedMulher = !selectedMulher;
                        }
                      });
                    },
                    child: Center(
                      child: AnimatedContainer(
                        color:
                            selectedMulher ? Colors.orange[700] : Colors.white,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: Image.asset(
                          "images/mulher.png",
                          semanticLabel: "Mulher",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                if (!selectedHomem && !selectedMulher) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Informe uma opção"),
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.orange[700],
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
              },
              backgroundColor: Colors.orange[700],
              label: Text('Próximo'),
              icon: Icon(Icons.forward),
              elevation: 6,
            ),
          ],
        ),
      ),
    );
  }
}
