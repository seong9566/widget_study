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
    return Scaffold(
      appBar: AppBar(
        title: const Text("위젯 바인딩 테스트"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ListView.builder(
                  itemCount: widgetLists!.length,
                  itemBuilder: ((context, index) {
                    return widgetLists![index];
                  }),
                ),
                InsertWidget(
                  widgetList: widgetLists,
                  onWidgetAdd: (() {
                    setState(() {});
                  }),
                ),
              ],
            ),
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const SizedBox(height: 20),
          //     //kWidgets.containerWidget(),
          //     widgetLists![0],
          //     const SizedBox(height: 100),
          //     //kWidgets.stackWidget(),
          //     widgetLists![1],
          //     const SizedBox(height: 20),
          //     widgetLists![2],
          //     const SizedBox(height: 20),

          //     InsertWidget(
          //       widgetList: widgetLists,
          //       onWidgetAdd: (() {
          //         setState(() {});
          //       }),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
