import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() {
  runApp(const BmiCalc());
}

class BmiCalc extends StatelessWidget {
  const BmiCalc({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blueGrey[800],
        ),
        scaffoldBackgroundColor: Colors.blueGrey[800],
      ),
      home: const InputPage(),
    );
  }
}
