
import 'package:apprappi/src/pages/login/login_page.dart';
import 'package:apprappi/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';

import 'package:apprappi/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de entrega',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),

      },
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: MyColors.primaryColor)
      ),
    );
  }
}


