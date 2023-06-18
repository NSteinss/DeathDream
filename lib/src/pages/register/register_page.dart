import 'package:flutter/material.dart'; // Importa el paquete de Flutter para material de diseño.
import 'package:get/get.dart'; // Importa el paquete 'get' para el manejo de estados.

import '../../controller/register_controller.dart'; // Importa el controlador de registro.

// ignore: camel_case_types, must_be_immutable
class registerPage extends StatelessWidget {
  // Clase de la página de registro, extiende de StatelessWidget.
  RegisterController con = Get.put(
      RegisterController()); // Crea una instancia del controlador de registro.

  registerPage({super.key}); // Constructor de la página de registro.

  @override
  Widget build(BuildContext context) {
    // Método build para construir la interfaz de la página.
    /////////////////////////////////////////////////////////////////////////////////////////////
    return Scaffold(
      // Retorna un Scaffold, que proporciona la estructura básica para una pantalla con AppBar y otras funcionalidades.
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          // Permite hacer scroll si el contenido excede el tamaño de la pantalla.
          child: Container(
        constraints: BoxConstraints(
          // Restricciones de tamaño para el contenedor principal.
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        decoration: const BoxDecoration(
          // Decoración del contenedor con un gradiente de colores.
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(33, 6, 130, 1),
              Color.fromARGB(255, 13, 198, 235),
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          // Columna que contiene los elementos de la página.
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _background(), // Llama al método privado _background para mostrar el fondo.
            Expanded(
              // Expande el espacio restante en la columna.
              flex: 6,
              child:
                  _background2(), // Llama al método privado _background2 para mostrar el contenido principal.
            )
          ],
        ),
      )),
    );
  }

  Widget _background() {
    // Método privado para mostrar el fondo de la página.
    return const Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Death Dream",
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
              '"El arte en cada gota, la esencia de Nicaragua en cada botella❤️"',
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
    // Método privado para mostrar el contenido principal de la página.
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
          _profilePhoto(), // Llama al método privado _profilePhoto para mostrar la foto de perfil.
          const SizedBox(
            height: 20.0,
          ),
          _name(), // Llama al método privado _name para mostrar el campo de nombre.
          const SizedBox(
            height: 20.0,
          ),
          _lastName(), // Llama al método privado _lastName para mostrar el campo de apellido.
          const SizedBox(
            height: 20.0,
          ),
          _phone(), // Llama al método privado _phone para mostrar el campo de teléfono.
          const SizedBox(
            height: 20.0,
          ),
          _email(), // Llama al método privado _email para mostrar el campo de correo electrónico.
          const SizedBox(
            height: 20.0,
          ),
          _password(), // Llama al método privado _password para mostrar el campo de contraseña.
          const SizedBox(
            height: 20.0,
          ),
          _buttonSignUp(), // Llama al método privado _buttonSignUp para mostrar el botón de registro.
          const SizedBox(
            height: 30.0,
          ),
          _doHaveAccount(), // Llama al método privado _doHaveAccount para mostrar el texto de "¿Ya tienes una cuenta?".
        ]),
      ),
    );
  }

  Widget _profilePhoto() {
    // Método privado para mostrar la foto de perfil.
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 110.0,
        height: 110.0,
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
        ),
        child: const Icon(
          Icons.person,
          size: 60.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _phone() {
    // Método privado para mostrar el campo de teléfono.
    return TextField(
      controller: con
          .phoneController, // Asigna el controlador de teléfono al TextField.
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDEB),
        hintText: "Teléfono",
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _name() {
    // Método privado para mostrar el campo de nombre.
    return TextField(
      controller:
          con.nameController, // Asigna el controlador de nombre al TextField.
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDEB),
        hintText: "Nombre",
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _lastName() {
    // Método privado para mostrar el campo de apellido.
    return TextField(
      controller: con
          .lastNameController, // Asigna el controlador de apellido al TextField.
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDEB),
        hintText: "Apellido",
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _email() {
    // Método privado para mostrar el campo de correo electrónico.
    return TextField(
      controller: con
          .emailController, // Asigna el controlador de correo electrónico al TextField.
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDEB),
        hintText: "Correo electrónico",
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _password() {
    // Método privado para mostrar el campo de contraseña.
    return TextField(
      controller: con
          .passwordController, // Asigna el controlador de contraseña al TextField.
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE7EDEB),
        hintText: "Contraseña",
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buttonSignUp() {
    // Método privado para mostrar el botón de registro.
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () =>
            con.register(), // Asigna la función de registro al botón.
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          // ignore: deprecated_member_use
          primary: Colors.blue[600],
          padding: const EdgeInsets.symmetric(vertical: 18.0),
        ),
        child: const Text(
          "Registrarse",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Widget _doHaveAccount() {
    // Método privado para mostrar el texto de "¿Ya tienes una cuenta?".
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "¿Ya tienes una cuenta?",
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 1, 14, 46),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () => con
              .goToLogin(), // Asigna la función para ir a la página de inicio de sesión al texto.
          child: Text(
            "Inicia Sesión",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
