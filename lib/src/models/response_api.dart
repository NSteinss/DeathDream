// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);

import 'dart:convert';

// Función para convertir una cadena JSON en un objeto ResponseApi
ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

// Función para convertir un objeto ResponseApi en una cadena JSON
String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

// Clase que representa la respuesta de la API
class ResponseApi {
  bool? success; // Indica si la petición fue exitosa
  String? message; // Mensaje de la respuesta
  dynamic data; // Datos de la respuesta

  // Constructor de la clase
  ResponseApi({this.success, this.message, this.data});

  // Método factory para crear un objeto ResponseApi a partir de un mapa (JSON)
  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
      success: json["success"], message: json["message"], data: json["data"]);

  // Método para convertir un objeto ResponseApi en un mapa (JSON)
  Map<String, dynamic> toJson() =>
      {"success": success, "message": message, "data": data};
}
