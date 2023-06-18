import 'package:death_dream/src/providers/users_provider.dart'; // Importa la clase UsersProvider desde el archivo users_provider.dart
import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para construir interfaces de usuario
import 'package:get/get.dart'; // Importa la biblioteca Get para la administración del estado y navegación entre pantallas
import 'package:get_storage/get_storage.dart';

import '../models/response_api.dart'; // Importa el modelo de datos ResponseApi desde el archivo response_api.dart

class LoginController extends GetxController {
  // Define la clase LoginController que extiende GetxController
  TextEditingController emailController =
      TextEditingController(); // Controlador de texto para el campo de correo electrónico
  TextEditingController passwordController =
      TextEditingController(); // Controlador de texto para el campo de contraseña

  UsersProvider usersProvider =
      UsersProvider(); // Instancia de la clase UsersProvider para realizar operaciones relacionadas con los usuarios

  void login() async {
    // Función para realizar el inicio de sesión
    String email = emailController.text
        .trim(); // Obtiene el valor del campo de correo electrónico y lo limpia de espacios en blanco
    String password = passwordController.text
        .trim(); // Obtiene el valor del campo de contraseña y lo limpia de espacios en blanco
    if (isValidForm(email, password)) {
      // Verifica si el formulario es válido llamando a la función isValidForm
      ResponseApi responseApi = await usersProvider.login(email,
          password); // Realiza el inicio de sesión llamando al método login del UsersProvider
      print(
          'ResponseApi${responseApi.toJson()}'); // Imprime en la consola la representación en JSON de la respuesta del inicio de sesión
      if (responseApi.success == true) {
        GetStorage()
            .write('user', responseApi.data); // Guarda el token en GetStorage
        // Si el inicio de sesión es exitoso
        goToHomePage();
      } else {
        Get.snackbar('Error',
            '${responseApi.message}', // Si el inicio de sesión falla, muestra un mensaje de error
            backgroundColor: Colors
                .redAccent); // Establece el color de fondo del mensaje como rojo
      }
    }
  }

  void goToHomePage() {
    // Función para navegar a la pantalla de inicio (home)
    Get.offAllNamed('/home'); // Navega a la pantalla de inicio (home) después de 2 segundos
  }

  bool isValidForm(String email, String password) {
    // Función para validar el formulario
    if (email.isEmpty) {
      // Verifica si el campo de correo electrónico está vacío
      Get.snackbar('Error',
          'El correo esta vacio'); // Muestra un mensaje de error utilizando Get.snackbar
      return false; // Retorna false indicando que el formulario no es válido
    } else if (password.isEmpty) {
      // Verifica si el campo de contraseña está vacío
      Get.snackbar(
          'Error', 'La contraseña esta vacia'); // Muestra un mensaje de error
      return false;
    } else if (password.length < 6) {
      // Verifica si la contraseña tiene menos de 6 caracteres
      Get.snackbar('Error',
          'La contraseña debe tener al menos 6 caracteres'); // Muestra un mensaje de error
      return false;
    } else if (password.length > 20) {
      // Verifica si la contraseña tiene más de 20 caracteres
      Get.snackbar('Error',
          'La contraseña debe tener menos de 20 caracteres'); // Muestra un mensaje de error
      return false;
    } else if (!GetUtils.isEmail(email)) {
      // Verifica si el correo electrónico no es válido utilizando GetUtils.isEmail
      Get.snackbar(
          'Error', 'El correo no es valido'); // Muestra un mensaje de error
      return false;
    } else {
      Get.snackbar('Success',
          'Datos correctos'); // Muestra un mensaje de éxito si todos los campos son válidos
      return true; // Retorna true indicando que el formulario es válido
    }
  }

  void goToRegister() {
    // Función para navegar a la pantalla de registro
    Get.toNamed(
        '/register'); // Utiliza Get.toNamed para navegar a la ruta '/register'
  }
}
