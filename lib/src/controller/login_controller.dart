import 'package:death_dream/src/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/response_api.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProvider.login(email, password);
      print('ResponseApi${responseApi.toJson()}');
      if (responseApi.success==true) {
        Get.snackbar('Success', '${responseApi.message}',
            backgroundColor: Colors.greenAccent);
        goToHome();
      } else {
        Get.snackbar('Error', '${responseApi.message}',
            backgroundColor: Colors.redAccent);
      }
      
    }
  }

  bool isValidForm(String email, String password) {
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
    } else {
      Get.snackbar('Success', 'Datos correctos');
      return true;
    }
  }

  void goToHome() {
    Get.toNamed('/home');
  }

  void goToRegister() {
    Get.toNamed('/register');
  }
}
