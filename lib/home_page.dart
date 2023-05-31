// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

import 'component/insert_button.dart';
import 'widget_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget>? widgetList;
  @override
  void initState() {
    super.initState();
    widgetList = <Widget>[ContainerWidget(), StackWidget()];
  }

  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("위젯 바인딩 테스트"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              //kWidgets.containerWidget(),
              widgetList![0],
              const SizedBox(height: 100),
              //kWidgets.stackWidget(),
              widgetList![1],
              InsertWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
