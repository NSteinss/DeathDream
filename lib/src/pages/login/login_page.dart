// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';

// ignore: camel_case_types
class loginPage extends StatelessWidget {
  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        decoration: const BoxDecoration(
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _background(),
            Expanded(
              flex: 5,
              child: _background2(),
            )
          ],
        ),
      )),
    );
  }

  Widget _background() {
    return const Expanded(
      flex: 3,
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
          _title(),
          const SizedBox(
            height: 30.0,
          ),
          _email(),
          const SizedBox(
            height: 20.0,
          ),
          _password(),
          const SizedBox(
            height: 20.0,
          ),
          _buttonForgot(),
          const SizedBox(
            height: 50.0,
          ),
          _buttonLogin(),
          const SizedBox(
            height: 80.0,
          ),
          _dontHaveAccount()
        ]),
      ),
    );
  }

  Widget _title() {
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
    return TextField(
      controller: con.emailController,
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
    return TextField(
      controller: con.passwordController,
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

  Widget _buttonForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "¿Olvidaste tu contraseña?",
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "¿Aún no tienes una cuenta?",
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
          onTap: () => con.goToRegister(),
          child: Text(
            "Registrate",
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => con.login(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          // ignore: deprecated_member_use
          primary: Colors.blue[600],
          padding: const EdgeInsets.symmetric(vertical: 18.0),
        ),
        child: const Text(
          "Iniciar Sesión",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
