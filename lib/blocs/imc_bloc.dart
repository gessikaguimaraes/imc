import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ImcBloc {
  var heightCtrl = new MaskedTextController(mask: '000');
  var weightCtrl = new MaskedTextController(mask: '000');
  var mensagem = "Preencha os dados para calcular seu IMC";
  var resultado = "";
  Color cor;

  calculate() {
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double imc = weight / (height * height);

    resultado = "${imc.toStringAsPrecision(2)}";

    if (imc < 18.6) {
      mensagem = "Abaixo do Peso";
      cor = Colors.red;
    } else if (imc >= 18.6 && imc < 24.9) {
      mensagem = "Peso Ideal";
      cor = Colors.green;
    } else if (imc >= 24.9 && imc < 29.9) {
      mensagem = "Levemente acima do peso";
      cor = Colors.orange;
    } else if (imc >= 29.9 && imc < 34.9) {
      mensagem = "Obesidade de Grau I";
      cor = Colors.red[700];
    } else if (imc >= 34.9 && imc <= 39.9) {
      mensagem = "Obesidade de Grau II";
      cor = Colors.red[800];
    } else if (imc >= 40) {
      mensagem = "Obesidade de Grau III";
      cor = Colors.red[900];
    }
  }
}
