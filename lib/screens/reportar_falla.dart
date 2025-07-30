import 'package:flutter/material.dart';
import '../services/falla_service.dart';

class ReportarFallaScreen extends StatefulWidget {
  @override
  _ReportarFallaScreenState createState() => _ReportarFallaScreenState();
}

class _ReportarFallaScreenState extends State<ReportarFallaScreen> {
  final _controller = TextEditingController();
  bool _enviando = false;
  String token = 'tu_token_generado'; // reemplazar con autenticación real

  void _enviarFalla() async {
    setState(() {
      _enviando = true;
    });

    bool exito = await FallaService.reportarFalla(token, _controller.text);

    setState(() {
      _enviando = false;
      _controller.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(exito ? 'Falla reportada' : 'Error al enviar'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reportar Falla')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Describe el problema...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _enviando
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _enviarFalla,
                    child: Text('Enviar'),
                  )
          ],
        ),
      ),
    );
  }
}
