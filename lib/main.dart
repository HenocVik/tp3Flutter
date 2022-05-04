import 'package:flutter/material.dart';
import 'package:tp_groupe5/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TP-API',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.amber[100],
          appBarTheme: AppBarTheme(
            elevation: 0.0,
          )),
      home: HomeSreen(),
    );
  }
}
