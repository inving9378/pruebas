import 'package:flutter/material.dart';
import 'screens/reportar_falla.dart';

void main() {
  runApp(MedussaApp());
}

class MedussaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medussa Cliente',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ReportarFallaScreen(),
    );
  }
}
