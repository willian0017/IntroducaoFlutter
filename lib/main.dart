import 'package:flutter/material.dart';
import 'package:introducao_flutter/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


