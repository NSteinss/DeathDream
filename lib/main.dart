import 'package:death_dream/src/pages/login/login_page.dart';
import 'package:death_dream/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
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
      title: 'Death Dream',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      
      getPages: [
        GetPage(name: '/', page: () => loginPage()),
        GetPage(name: '/register', page: () =>  registerPage()),
      ],
      navigatorKey: Get.key,
    );
  }
}
