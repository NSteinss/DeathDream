// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';

// ignore: camel_case_typess
class loginPage extends StatelessWidget {
  LoginController con = Get.put(
      LoginController()); // Importa y asigna un controlador de inicio de sesión

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Permite redimensionar la interfaz para evitar que el teclado cubra el contenido
      body: SingleChildScrollView(
          // Un widget que permite desplazar su contenido cuando el teclado está visible
          child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(33, 6, 130, 1), // Color degradado para el fondo
              Color.fromARGB(255, 13, 198, 235),
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _background(), // Llama a la función que devuelve un widget para el fondo
            Expanded(
              flex: 5,
              child:
                  _background2(), // Llama a la función que devuelve un widget para el contenido principal
            )
          ],
        ),
      )),
    );
  }

  Widget _background() {
    // Función que devuelve un widget para el fondo
    return const Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Death Dream", // Título en el fondo
              style: TextStyle(
                fontFamily: "Sofia",
                color: Colors.white,
                fontSize: 52.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '"El arte en cada gota, la esencia de Nicaragua en cada botella❤️"', // Texto en el fondo
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(195, 255, 255, 255),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _background2() {
    // Función que devuelve un widget para el contenido principal
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _title(), // Llama a la función que devuelve un widget para el título
          const SizedBox(
            height: 30.0,
          ),
          _email(), // Llama a la función que devuelve un widget para el campo de correo electrónico
          const SizedBox(
            height: 20.0,
          ),
          _password(), // Llama a la función que devuelve un widget para el campo de contraseña
          const SizedBox(
            height: 20.0,
          ),
          _buttonForgot(), // Llama a la función que devuelve un widget para el botón de "¿Olvidaste tu contraseña?"
          const SizedBox(
            height: 50.0,
          ),
          _buttonLogin(), // Llama a la función que devuelve un widget para el botón de inicio de sesión
          const SizedBox(
            height: 80.0,
          ),
          _dontHaveAccount() // Llama a la función que devuelve un widget para el texto "¿Aún no tienes una cuenta?"
        ]),
      ),
    );
  }

  Widget _title() {
    // Función que devuelve un widget para el título
    return const Text(
      "Inicio de sesión",
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w200,
        height: -1,
        color: Colors.blueGrey,
      ),
    );
  }

  Widget _email() {
    // Función que devuelve un widget para el campo de correo electrónico
    return TextField(
      controller: con
          .emailController, // Asigna un controlador de texto para el campo de correo electrónico
      keyboardType: TextInputType
          .emailAddress, // Establece el tipo de teclado como dirección de correo electrónico
      decoration: InputDecoration(
        filled: true,
        fillColor:
            const Color(0xFFE7EDEB), // Color de fondo para el campo de texto
        hintText:
            "Correo electrónico", // Texto de sugerencia dentro del campo de texto
        prefixIcon: Icon(
          Icons.mail, // Icono de correo electrónico antes del campo de texto
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // Borde del campo de texto
          borderRadius: BorderRadius.circular(8.0), // Radio de borde redondeado
        ),
      ),
    );
  }

  Widget _password() {
    // Función que devuelve un widget para el campo de contraseña
    return TextField(
      controller: con
          .passwordController, // Asigna un controlador de texto para el campo de contraseña
      obscureText: true, // Oculta el texto de la contraseña
      decoration: InputDecoration(
        filled: true,
        fillColor:
            const Color(0xFFE7EDEB), // Color de fondo para el campo de texto
        hintText: "Contraseña", // Texto de sugerencia dentro del campo de texto
        prefixIcon: Icon(
          Icons.lock, // Icono de candado antes del campo de texto
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // Borde del campo de texto
          borderRadius: BorderRadius.circular(8.0), // Radio de borde redondeado
        ),
      ),
    );
  }

  Widget _buttonForgot() {
    // Función que devuelve un widget para el botón "¿Olvidaste tu contraseña?"
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "¿Olvidaste tu contraseña?", // Texto del botón "¿Olvidaste tu contraseña?"
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.blue[800],
            decoration: TextDecoration.underline,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _dontHaveAccount() {
    // Función que devuelve un widget para el texto "¿Aún no tienes una cuenta?"
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "¿Aún no tienes una cuenta?", // Texto antes del enlace "Registrate"
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 17.0,
            color: Color.fromARGB(255, 1, 14, 46),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () => con
              .goToRegister(), // Llama a una función cuando se hace clic en el enlace "Registrate"
          child: Text(
            "Registrate", // Enlace "Registrate"
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Widget _buttonLogin() {
    // Función que devuelve un widget para el botón de inicio de sesión
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => con
            .login(), // Llama a la función de inicio de sesión cuando se presiona el botón
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8.0), // Radio de borde redondeado para el botón
          ),
          primary: Colors.blue[600], // Color de fondo del botón
          padding: const EdgeInsets.symmetric(
              vertical: 18.0), // Espaciado interno vertical para el botón
        ),
        child: const Text(
          "Iniciar Sesión", // Texto del botón de inicio de sesión
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
