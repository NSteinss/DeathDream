import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/register_controller.dart';

// ignore: camel_case_types, must_be_immutable
class registerPage extends StatelessWidget {
  RegisterController con = Get.put(RegisterController());

  registerPage({super.key});
  @override
  Widget build(BuildContext context) {
    /////////////////////////////////////////////////////////////////////////////////////////////
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
              flex: 6,
              child: _background2(),
            )
          ],
        ),
      )),
    );
  }

  Widget _background() {
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
          _profilePhoto(),
          const SizedBox(
            height: 20.0,
          ),
          _name(),
          const SizedBox(
            height: 20.0,
          ),
          _lastName(),
          const SizedBox(
            height: 20.0,
          ),
          _phone(),
          const SizedBox(
            height: 20.0,
          ),
          _email(),
          const SizedBox(
            height: 20.0,
          ),
          _password(),
          const SizedBox(
            height: 20.0,
          ),
          _buttonSignUp(),
          const SizedBox(
            height: 30.0,
          ),
          _doHaveAccount(),
        ]),
      ),
    );
  }

  Widget _profilePhoto() {
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
    return TextField(
      controller: con.phoneController,
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
    return TextField(
      controller: con.nameController,
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
    return TextField(
      controller: con.lastNameController,
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

  Widget _buttonSignUp() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => con.register(),
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
          onTap: () => con.goToLogin(),
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
  /////////////////////

