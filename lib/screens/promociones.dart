import 'package:flutter/material.dart';
import '../services/api_service.dart';

class PromocionesScreen extends StatefulWidget {
  @override
  _PromocionesScreenState createState() => _PromocionesScreenState();
}

class _PromocionesScreenState extends State<PromocionesScreen> {
  List promociones = [];
  bool cargando = true;
  String token = 'tu_token_generado'; // reemplazar con autenticación real

  @override
  void initState() {
    super.initState();
    cargarPromociones();
  }

  void cargarPromociones() async {
    try {
      final data = await ApiService.obtenerPromociones(token);
      setState(() {
        promociones = data;
        cargando = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Promociones')),
      body: cargando
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: promociones.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(promociones[index]['codigo']),
                  subtitle: Text(promociones[index]['beneficio']),
                );
              },
            ),
    );
  }
}
