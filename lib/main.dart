// ignore_for_file: prefer_const_constructors

import 'package:d0t/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWeb());
}

class MyWeb extends StatelessWidget {
  const MyWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
