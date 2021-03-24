import 'package:conexion_con_apis/modelo/chiste.dart';
import 'package:dio/dio.dart';

Future<Chiste> obtenerChisteAleatorio() async {
  final respuesta =
      await Dio().get('https://official-joke-api.appspot.com/random_joke');

  final Map<String, dynamic> json = respuesta.data;

  final Chiste chiste = Chiste.fromJson(json);

  return chiste;
}
