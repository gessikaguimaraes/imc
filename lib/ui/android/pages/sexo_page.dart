import 'package:flutter/material.dart';
import 'package:imc/ui/android/pages/home_page.dart';

import 'configuracao_page.dart';

class SexoPage extends StatefulWidget {
  @override
  _SexoPageState createState() => _SexoPageState();
}

class _SexoPageState extends State<SexoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione o sexo"),
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
          children: <Widget>[
            Icon(
              Icons.wc,
              size: 400,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              backgroundColor: Colors.orange,
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
