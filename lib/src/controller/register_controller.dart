// ignore_for_file: avoid_print
import 'package:death_dream/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:death_dream/src/providers/users_provider.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async {
    String name = nameController.text;
    String lastname = lastNameController.text;
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (isValidForm(name, lastname, phone, email, password)) {
      User user = User(
          name: name,
          lastname: lastname,
          phone: phone,
          email: email,
          password: password);

      Response response = await usersProvider.create(user);
      print('RESPONSE ${response.body}');
      Get.snackbar('Success', 'Datos correctos');
      goToLogin();
    }
  }

  bool isValidForm(String name, String lastName, String phone, String email,
      String password) {
    if (email.isEmpty) {
      Get.snackbar('Error', 'El correo esta vacio');
      return false;
    } else if (password.isEmpty) {
      Get.snackbar('Error', 'La contraseña esta vacia');
      return false;
    } else if (password.length < 6) {
      Get.snackbar('Error', 'La contraseña debe tener al menos 6 caracteres');
      return false;
    } else if (password.length > 20) {
      Get.snackbar('Error', 'La contraseña debe tener menos de 20 caracteres');
      return false;
    } else if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'El correo no es valido');
      return false;
    } else if (name.isEmpty) {
      Get.snackbar('Error', 'El nombre esta vacio');
      return false;
    } else if (lastName.isEmpty) {
      Get.snackbar('Error', 'El apellido esta vacio');
      return false;
    } else if (phone.isEmpty) {
      Get.snackbar('Error', 'El telefono esta vacio');
      return false;
    } else if (phone.length < 8) {
      Get.snackbar('Error', 'El telefono no es valido');
      return false;
    } else {
      Get.snackbar('Success', 'Datos correctos');
      return true;
    }
  }

  void goToLogin() {
    Get.toNamed('/');
  }
}
