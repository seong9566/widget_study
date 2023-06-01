// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'component/insert_button.dart';
import 'widget_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget>? widgetLists;
  @override
  void initState() {
    super.initState();
    widgetLists = <Widget>[
      ContainerWidget(),
      StackWidget(),
      ListWidget(),
      // ContainerWidget() 얘가 동적으로 입력 되야함.
    ];
  }

  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

  @override
  Widget build(BuildContext context) {
    Logger().d("위젯의 길이 확인 : ${widgetLists!.length}");
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("위젯 바인딩 테스트"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView.builder(
          itemCount: widgetLists!.length + 1,
          itemBuilder: (context, index) {
            if (index == widgetLists!.length) {
              return InsertWidget(
                widgetList: widgetLists,
                onWidgetAdd: () {
                  setState(() {});
                },
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: widgetLists![index],
              );
            }
          },
        ),
      ),
    );
  }
}
