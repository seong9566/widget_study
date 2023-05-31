import 'package:flutter/material.dart';

/*
TODO
1. 위젯 분리
2. 위젯 변수화
3. 위젯 관리
*/
class Widgets {
  List<Widget> cachedImageWidgets = <Widget>[];

  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

// function list

  Widget containerWidget() {
    return Container(
      width: fWidth,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "책임감이 강합니다.",
              style: TextStyle(fontWeight: fWeight, fontSize: fTitleSize),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            Text(
              "책임감이 강한 사람은 자신이 맡은 일에 대해 책임을 지고 최선을 다하며, 어려움에 직면해도 꾸준히 노력하여 목표를 이루는 데 주도적인 역할을 합니다. 이러한 사람들은 신뢰와 예측 가능성을 제공하며, 주변 사람들에게는 안정감과 동기부여를 주는 존재입니다.",
              style: TextStyle(fontSize: fContentSize),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget stackWidget() {
    return Stack(
      children: [
        SizedBox(
          width: fWidth,
          height: fHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/profile.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "홍길동",
                      style: TextStyle(fontSize: fTitleSize),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "조선대학교, 정보공학과",
                      style: TextStyle(fontSize: fContentSize),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          child: listWidget(),
        ),
      ],
    );
  }

  Widget listWidget() {
    return SizedBox(
      // 변수화
      //width: MediaQuery.of(context).size.width / 2,
      width: fWidth,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cachedImageWidgets.length,
        itemBuilder: (BuildContext context, int index) {
          return cachedImageWidgets[index];
        },
      ),
    );
  }
}
