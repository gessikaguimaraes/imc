import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatefulWidget {
  @override
  _ConfiguracaoPageState createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Colors.orange,
      title: Text(
        "Configuração",
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 4,
                  left: 16,
                  right: 16,
                  bottom: 4,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.my_location,
                      color: Colors.black87,
                    ),
                    hintText: "Meta",
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
