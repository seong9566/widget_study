// ignore_for_file: sized_box_for_whitespace

import 'package:d0t/image_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImageCard imageCard = ImageCard();

  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

  final List<Widget> cachedImageWidgets = [];

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
              Container(
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
              ),
              const SizedBox(height: 100),
              Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: fWidth, maxHeight: fHeight),
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
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageCard.fContents.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (cachedImageWidgets.length <= index) {
                            cachedImageWidgets.add(imageCard.fContents[index]);
                          }
                          return cachedImageWidgets[index];
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("ImageCard 위젯 추가"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
