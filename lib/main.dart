
import 'package:flutter/material.dart';

import 'SCREEN/IIHomeScreen.dart';
import 'SCREEN/IILoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home:  //IIHomeScreen()
      IILoginScreen(),
    );
  }
}
