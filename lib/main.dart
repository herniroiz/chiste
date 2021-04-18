import 'package:conexion_con_apis/servicio/chiste_servicio.dart';
import 'package:flutter/material.dart';

import 'modelo/chiste.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PantallaPrincipal());
  }
}

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Chiste>(
        future: obtenerChisteAleatorio(),
        builder: (context, estado) => (estado.data == null)
            ? estado.hasError
                ? Center(child: Text('Error'))
                : Center(
                    child: CircularProgressIndicator(),
                  )
            : Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChisteWidget(
                    texto1: estado.data.chiste,
                    texto2: estado.data.remate,
                  ),
                ),
            ),
      ),
    );
  }
}

class ChisteWidget extends StatelessWidget {
  const ChisteWidget({
    Key key,
    this.texto1,
    this.texto2,
  }) : super(key: key);

  final String texto1;
  final String texto2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(texto1),
        Text(
          texto2.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
