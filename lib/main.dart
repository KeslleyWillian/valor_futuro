import 'package:flutter/material.dart';
import 'package:valor_futuro/widget_combustivel.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue),
      home: Home() ,
   );
 }
}







/*
void main() => runApp(ValorFuturo());

class ValorFuturo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ValorFuturo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: WidgetsBasicos(),
    );
  }
}

String placeholder = "0";

class WidgetsBasicos extends StatelessWidget {
  final myControllerSaldoInicial = TextEditingController();
  final myControllerJuros = TextEditingController();
  final myControllerMeses = TextEditingController();
  final myControllerSaldoFinal = TextEditingController();
  /*@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
}
*/
  String resultado;
  Widget buildButton(String buttonText,context,controllerSaldoIncial,controllerJuros,controllerMeses,controllerSaldo,type) {
    

      int resultado = int.parse(controllerSaldoIncial.text);  
      resultado = resultado + 1;
      print(resultado)
    return new Expanded(
        child: new RaisedButton(
            child: new Text(buttonText),
            onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(resultado.text),
              );
            },
          );
        },
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.all(15)));
  }

  Widget campo_saldo() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.person),
          hintText: 'Saldo inicial'),
          controller: myControllerSaldoInicial,
          
    );
  }

  Widget campo_juros() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.monetization_on),
          hintText: 'Juros'),
          controller: myControllerJuros,
    );
  }

  Widget campo_final() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.trending_up),
          hintText: 'Saldo final'),
          controller: myControllerSaldoFinal,
    );
  }

  Widget campo_meses() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.calendar_today),
          hintText: 'Quantidade de meses'),
          controller: myControllerMeses,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ValorFuturo"),
      ),
      body: new Container(
          child: new Column(children: <Widget>[
        new Text("oi"),
        new Container(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                campo_saldo(),
                campo_juros(),
                campo_meses(),
                campo_final(),
              ])),
        ),
        new Row(children: [
          buildButton("Descobrir o saldo inicial",context,myControllerSaldoInicial,myControllerJuros,myControllerMeses,myControllerSaldoFinal,"saldoInicial"),
        ]),
        new Row(children: [
          buildButton("Descobrir o percentual de juros",context,myControllerSaldoInicial,myControllerJuros,myControllerMeses,myControllerSaldoFinal,"juros"),
        ]),
        new Row(children: [
          buildButton("Descobrir a quantidade de meses",context,myControllerSaldoInicial,myControllerJuros,myControllerMeses,myControllerSaldoFinal,"meses"),
        ]),
        new Row(children: [
          buildButton("Descobrir o Saldo Final",context,myControllerSaldoInicial,myControllerJuros,myControllerMeses,myControllerSaldoFinal,"saldoFinal"),
        ])
      ])),
    );
  }
}
*/