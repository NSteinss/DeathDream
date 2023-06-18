import 'package:death_dream/src/environments/environments.dart'; // Importa el archivo de entornos que contiene la URL de la API
import 'package:death_dream/src/models/response_api.dart'; // Importa el modelo ResponseApi
import 'package:death_dream/src/models/user.dart'; // Importa el modelo User
import 'package:get/get.dart'; // Importa la biblioteca Get para el manejo del estado y la visualización de mensajes

// ignore: camel_case_types
class UsersProvider extends GetConnect {
  String url =
      '${Enviroment.API_URL}api/users'; // URL de la API obtenida del archivo de entornos
  Future<Response> create(User user) async {
    Response response = await post('$url/create',
        user.toJson(), // Realiza una solicitud POST a la URL de creación de usuario
        headers: {
          'Content-Type': 'application/json'
        }); // Establece las cabeceras de la solicitud
    return response; // Retorna la respuesta recibida
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post('$url/login', {
      'email': email,
      'password': password
    }, // Realiza una solicitud POST a la URL de inicio de sesión con el correo electrónico y la contraseña proporcionados
        headers: {
          'Content-Type': 'application/json'
        }); // Establece las cabeceras de la solicitud
    if (response.body == null) {
      Get.snackbar('Error',
          'No fue posible realizar la petición'); // Muestra un mensaje de error si la respuesta no contiene cuerpo
      return ResponseApi(); // Retorna un objeto ResponseApi vacío
    }
    ResponseApi responseApi = ResponseApi.fromJson(response
        .body); // Convierte el cuerpo de la respuesta en un objeto ResponseApi
    return responseApi; // Retorna el objeto ResponseApi
  }
}
