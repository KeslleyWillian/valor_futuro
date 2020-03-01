import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Widget TextField",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: WidgetsBasicos(),
    );
  }
}

class WidgetsBasicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ksjsoksok");
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget TextField"),
      ),
      body: Container(
        color: Colors.white,
        child: widgetTextField(),
      ),
    );
  }

  widgetTextField() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.person),
          hintText: 'Informe o nome'),
    );
  }
}
