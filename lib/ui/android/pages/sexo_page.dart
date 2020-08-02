import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imc/ui/android/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SexoPage extends StatefulWidget {
  @override
  _SexoPageState createState() => _SexoPageState();
}

class _SexoPageState extends State<SexoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool selectedHomem = false;
  bool selectedMulher = false;
  String sexo;

  Future<bool> save() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("sexo", sexo);
  }

  Future<String> load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("sexo");
  }

  setData() {
    load().then((value) {
      setState(() {
        sexo = value;
      });
    });
  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Selecione o sexo"),
        backgroundColor: Colors.orange[700],
        automaticallyImplyLeading: false,
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
                          sexo = "M";
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
                          sexo = "M";
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
                  save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
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
