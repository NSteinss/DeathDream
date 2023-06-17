import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if(isValidForm(email, password)){
      Get.snackbar('Success', 'Datos correctos');
      goToHome();
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
    }else if (!GetUtils.isEmail(email)) {
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
