import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracaoPage extends StatefulWidget {
  @override
  _ConfiguracaoPageState createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  TextEditingController controller = TextEditingController();

  Future<bool> save() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("meta", controller.text);
  }

  Future<String> load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("meta");
  }

  setData() {
    load().then((value) {
      setState(() {
        controller.text = value;
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
                  controller: controller,
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
                  onPressed: () {
                    save();
                  },
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
