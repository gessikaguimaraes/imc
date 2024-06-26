import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ImcBloc {
  var heightCtrl = new MaskedTextController(mask: '000');
  var weightCtrl = new MaskedTextController(mask: '000');
  var idade = TextEditingController();
  String mensagem = "Preencha os dados para calcular seu IMC";
  String resultado = "";
  String pesoIdeal = "";
  Color cor;
  String formulaLorentz = "";

  calculate(sexo) {
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double imc = weight / (height * height);
    double pesoMinimo;
    double pesoMaximo;
    int k;
    if (sexo == "M") {
      k = 4;
    } else if (sexo == "F") {
      k = 2;
    }

    resultado = "${imc.toStringAsPrecision(2)}";

    double formula = double.parse(heightCtrl.text) -
        100 -
        (double.parse(heightCtrl.text) - 150) / k;
    formulaLorentz = "${formula.toStringAsPrecision(2)} kg";

    int i = int.parse(idade.text);
    if (i >= 1 && i <= 19) {
      pesoMinimo = height * height * 3;
      pesoMaximo = height * height * 85;
      if (imc < 3) {
        mensagem = "IMC Baixo";
        cor = Colors.red;
      } else if (imc >= 3 && imc < 85) {
        mensagem = "IMC Adequado";
        cor = Colors.green;
      } else if (imc >= 85 && imc < 97) {
        mensagem = "Sobrepeso";
        cor = Colors.orange;
      } else if (imc >= 97) {
        mensagem = "Obesidade";
        cor = Colors.red[700];
      }
    } else if (i >= 20 && i <= 59) {
      pesoMinimo = height * height * 18.6;
      pesoMaximo = height * height * 24.9;
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
    } else if (i > 60) {
      pesoMinimo = height * height * 22;
      pesoMaximo = height * height * 27;
      if (imc <= 22) {
        mensagem = "Abaixo do Peso";
        cor = Colors.red;
      } else if (imc > 22 && imc <= 27) {
        mensagem = "Saudável";
        cor = Colors.green;
      } else if (imc > 27 && imc <= 30) {
        mensagem = "Sobrepeso";
        cor = Colors.orange;
      } else if (imc > 30) {
        mensagem = "Obesidade";
        cor = Colors.red[700];
      }
    }
    pesoIdeal = "$pesoMinimo a $pesoMaximo kg";
  }
}
/*
Adulto: 20 a 59 anos
criança: 6 meses a 19 anos

Calculo IMC:
imc = peso/(altura * altura)
peso = altura * altura *imc

Formula de Lorentz:
P = h - 100 - (h-150)/k
k =4, homem
k=2, mulher
h = altura em cm
 */
