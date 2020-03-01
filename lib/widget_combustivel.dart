import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController saldoInicialController = TextEditingController();
  TextEditingController jurosController = TextEditingController();
  TextEditingController mesesController = TextEditingController();
  TextEditingController saldoFinalController = TextEditingController();
  String _infoText = "Deixe em branco o campo que você deseja descobrir o valor";

  void _resetFields() {
    saldoInicialController.text = "";
    jurosController.text = "";
    mesesController.text = "";
    saldoFinalController.text = "";
    setState(() {
      _infoText = "Informe o valor de cada combustível";
      _formkey = GlobalKey<FormState>();
    });
  }

  double exp(double x, int n) {
    if (n == 0) return 1;
    if (n == 1) return x;
    var r = exp(x * x, n ~/ 2);
    if (n % 2 == 1) r *= x;
    return r;
  }

  void calculaSaldoInicial() {
    setState(() {
      double saldoFinal = double.parse(saldoFinalController.text);
      double juros = double.parse(jurosController.text);
      int meses = int.parse(mesesController.text);
      double resultado = saldoFinal / exp((1 + (juros / 100)), meses);
      _infoText = (resultado.toStringAsPrecision(5));

      _infoText =
          "O Saldo Inicial era de ${resultado.toStringAsPrecision(5)} reais.";
    });
  }

  void calculaJuros() {
    setState(() {
      double saldoInicial = double.parse(saldoInicialController.text);
      double saldoFinal = double.parse(saldoFinalController.text);
      int meses = int.parse(mesesController.text);
      double resultado =
          (saldoFinal - saldoInicial) / (saldoInicial * meses) * 100;
      _infoText = (resultado.toStringAsPrecision(5));

      _infoText =
          "Sua taxa de juros é de aproximadamente ${resultado.toStringAsPrecision(5)}%.";
    });
  }

    void calculaMeses() {
    setState(() {
      double saldoInicial = double.parse(saldoInicialController.text);
      double saldoFinal = double.parse(saldoFinalController.text);
      double juros = double.parse(jurosController.text);
      double resultado =
          (saldoFinal - saldoInicial) / (saldoInicial * juros)*100;
      _infoText = (resultado.toStringAsPrecision(5));

      _infoText =
          "O Saldo Final será atingido em ${resultado.toStringAsPrecision(5)} meses.";
    });
  }

  void calculaSaldoFinal() {
    setState(() {
      double saldoInicial = double.parse(saldoInicialController.text);
      double juros = double.parse(jurosController.text);
      int meses = int.parse(mesesController.text);
      double resultado = exp((1 + (juros / 100)), meses) * saldoInicial;
      _infoText = (resultado.toStringAsPrecision(5));

      _infoText =
          "Em ${meses} meses você terá um montante de ${resultado.toStringAsPrecision(5)} reais.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ValorFuturo'),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
          child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildTextFormSaldoInicial(),
                  buildTextFormJuros(),
                  buildTextFormMeses(),
                  buildTextFormSaldoFinal(),
                  buildContainerButtonSaldoInicial(context),
                  buildContainerButtonJuros(context),
                  buildContainerButtonMeses(context),
                  buildContainerButtonSaldoFinal(context),
                  buildTextInfo()
                ]),
          ),
        ));
  }

  TextFormField buildTextFormSaldoInicial() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Saldo Inicial",
        labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      controller: saldoInicialController,
    );
  }

  TextFormField buildTextFormJuros() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Percentual de Juros",
        labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      controller: jurosController,
    );
  }

  TextFormField buildTextFormMeses() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Quantidade de Meses",
        labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      controller: mesesController,
    );
  }

  TextFormField buildTextFormSaldoFinal() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Saldo Final",
        labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      controller: saldoFinalController,
    );
  }

  Container buildContainerButtonSaldoInicial(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
      height: 60.0,
      child: RaisedButton(
        onPressed: () {
          calculaSaldoInicial();
        },
        child: Text("Descobrir Saldo Inicial",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        color: Colors.lightGreen,
      ),
    );
  }

  Container buildContainerButtonJuros(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10.0),
      height: 60.0,
      child: RaisedButton(
        onPressed: () {
          calculaJuros();
        },
        child: Text("Descobrir Percentual de Juros Mensal",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        color: Colors.lightGreen,
      ),
    );
  }

  Container buildContainerButtonMeses(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      height: 75.0,
      child: RaisedButton(
        onPressed: () {
          calculaMeses();
        },
        child: Text("Descobrir Quantidade de Meses",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
            textAlign: TextAlign.center),
        color: Colors.lightGreen,
        
      ),
    );
  }

  Container buildContainerButtonSaldoFinal(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      height: 60.0,
      child: RaisedButton(
        onPressed: () {
          calculaSaldoFinal();
        },
        child: Text("Descobrir Saldo Final",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        color: Colors.lightGreen,
      ),
    );
  }

  Text buildTextInfo() {
    return Text(_infoText,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 20.0));
  }
}
