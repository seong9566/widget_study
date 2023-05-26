// ignore_for_file: prefer_const_constructors

import 'package:d0t/home_page.dart';
import 'package:d0t/my_custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

void main() {
  // if (kIsWeb) {
  //   runApp(const MyWeb());
  // } else {
  //   print("웹으로 실행 해주세요.");
  // }
  runApp(const MyWeb());
}

class MyWeb extends StatelessWidget {
  const MyWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      //scrollBehavior: ScrollBehavior(),
      home: HomePage(),
    );
  }
}
