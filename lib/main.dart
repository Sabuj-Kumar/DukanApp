import 'package:dokan/LogInPage/login_page.dart';
import 'package:dokan/Views/home_page.dart';
import 'package:dokan/Views/person_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Utils/constants.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dukan App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: backgroundColor,
      ),
      home: LogInPage(email: null, image: null),
    );
  }
}
