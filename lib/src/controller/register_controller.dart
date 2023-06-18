// ignore_for_file: avoid_print // Ignora las advertencias de no utilizar la función print
import 'package:death_dream/src/models/user.dart'; // Importa el modelo de datos User desde el archivo user.dart
import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para construir interfaces de usuario
import 'package:get/get.dart'; // Importa la biblioteca Get para la administración del estado y navegación entre pantallas
import 'package:death_dream/src/providers/users_provider.dart'; // Importa la clase UsersProvider desde el archivo users_provider.dart

class RegisterController extends GetxController {
  // Define la clase RegisterController que extiende GetxController
  TextEditingController nameController =
      TextEditingController(); // Controlador de texto para el campo de nombre
  TextEditingController lastNameController =
      TextEditingController(); // Controlador de texto para el campo de apellido
  TextEditingController phoneController =
      TextEditingController(); // Controlador de texto para el campo de teléfono
  TextEditingController emailController =
      TextEditingController(); // Controlador de texto para el campo de correo electrónico
  TextEditingController passwordController =
      TextEditingController(); // Controlador de texto para el campo de contraseña

  UsersProvider usersProvider =
      UsersProvider(); // Instancia de la clase UsersProvider para realizar operaciones relacionadas con los usuarios

  void register() async {
    // Función para realizar el registro
    String name = nameController.text; // Obtiene el valor del campo de nombre
    String lastname =
        lastNameController.text; // Obtiene el valor del campo de apellido
    String phone = phoneController.text
        .trim(); // Obtiene el valor del campo de teléfono y lo limpia de espacios en blanco
    String email = emailController.text
        .trim(); // Obtiene el valor del campo de correo electrónico y lo limpia de espacios en blanco
    String password = passwordController.text
        .trim(); // Obtiene el valor del campo de contraseña y lo limpia de espacios en blanco
    if (isValidForm(name, lastname, phone, email, password)) {
      // Verifica si el formulario es válido llamando a la función isValidForm
      User user = User(
          // Crea una instancia del modelo User con los datos del formulario
          name: name,
          lastname: lastname,
          phone: phone,
          email: email,
          password: password);

      Response response = await usersProvider.create(
          user); // Llama al método create del UsersProvider para crear un nuevo usuario
      print(
          'RESPONSE ${response.body}'); // Imprime en la consola el cuerpo de la respuesta del servidor
      Get.snackbar('Success',
          'Datos correctos'); // Muestra un mensaje de éxito utilizando Get.snackbar
      goToLogin(); // Navega a la pantalla de inicio de sesión
    }
  }

  bool isValidForm(String name, String lastName, String phone, String email,
      String password) {
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
    } else if (name.isEmpty) {
      // Verifica si el campo de nombre está vacío
      Get.snackbar(
          'Error', 'El nombre esta vacio'); // Muestra un mensaje de error
      return false;
    } else if (lastName.isEmpty) {
      // Verifica si el campo de apellido está vacío
      Get.snackbar(
          'Error', 'El apellido esta vacio'); // Muestra un mensaje de error
      return false;
    } else if (phone.isEmpty) {
      // Verifica si el campo de teléfono está vacío
      Get.snackbar(
          'Error', 'El telefono esta vacio'); // Muestra un mensaje de error
      return false;
    } else if (phone.length < 8) {
      // Verifica si el teléfono tiene menos de 8 caracteres
      Get.snackbar(
          'Error', 'El telefono no es valido'); // Muestra un mensaje de error
      return false;
    } else {
      Get.snackbar('Success',
          'Datos correctos'); // Muestra un mensaje de éxito si todos los campos son válidos
      return true; // Retorna true indicando que el formulario es válido
    }
  }

  void goToLogin() {
    // Función para navegar a la pantalla de inicio de sesión
    Get.toNamed('/'); // Utiliza Get.toNamed para navegar a la ruta '/'
  }
}
