import 'package:death_dream/src/pages/home/home_page.dart';
import 'package:death_dream/src/pages/login/login_page.dart'; // Importa la página de inicio de sesión desde el archivo login_page.dart
import 'package:death_dream/src/pages/register/register_page.dart'; // Importa la página de registro desde el archivo register_page.dart
import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter para construir interfaces de usuario
import 'package:get/get.dart'; // Importa la biblioteca Get para la administración del estado y navegación entre pantallas
import 'package:get_storage/get_storage.dart'; // Importa la biblioteca GetStorage para el almacenamiento persistente de datos

void main() async {
  await GetStorage
      .init(); // Inicializa GetStorage para el almacenamiento persistente de datos
  runApp(
      const MyApp()); // Inicia la aplicación Flutter envolviendo la clase MyApp en un widget MaterialApp
}

class MyApp extends StatefulWidget {
  const MyApp({super.key}); // Constructor de la clase MyApp

  @override
  State<MyApp> createState() =>
      _MyAppState(); // Crea el estado mutable de MyApp
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Death Dream', // Título de la aplicación
      debugShowCheckedModeBanner:
          false, // Desactiva la visualización del banner de modo de depuración
      initialRoute: '/', // Ruta inicial de la aplicación

      getPages: [
        GetPage(
            name: '/',
            page: () =>
                loginPage()), // Define la página de inicio de sesión en la ruta '/'
        GetPage(
            name: '/register',
            page: () =>
                registerPage()), // Define la página de registro en la ruta '/register'
        GetPage(
            name: '/home',
            page: () =>
                HomePage()), // Define la página de inicio en la ruta '/home'
      ],
      navigatorKey: Get
          .key, // Asigna una clave de navegación a Get para gestionar la navegación entre pantallas
    );
  }
}
