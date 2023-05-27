// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final ImageCard imageCard = ImageCard();

  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

  final List<Widget> cachedImageWidgets = <Widget>[];

  void addContent(String imagePath, String text) {
    setState(
      () {
        cachedImageWidgets.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  width: 150,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> openDialog() async {
    final ImageProvider? image = await showDialog<ImageProvider>(
      context: context,
      builder: (BuildContext context) {
        String imagePath = '';
        String text = '';

        return AlertDialog(
          title: const Text('이미지와 텍스트 입력'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  imagePath = value;
                },
                decoration: const InputDecoration(
                  labelText: '이미지 경로',
                ),
              ),
              TextField(
                onChanged: (value) {
                  text = value;
                },
                decoration: const InputDecoration(
                  labelText: '텍스트',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                addContent(imagePath, text);
                Navigator.of(context).pop();
              },
              child: const Text('추가'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
          ],
        );
      },
    );
  }

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
                        style: TextStyle(
                            fontWeight: fWeight, fontSize: fTitleSize),
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
                    child: SizedBox(
                      //width: MediaQuery.of(context).size.width / 2,
                      width: fWidth,
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cachedImageWidgets.length,
                        itemBuilder: (BuildContext context, int index) {
                          Logger().d("몇개가 있니? ${cachedImageWidgets.length}");
                          return cachedImageWidgets[index];
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  openDialog();
                },
                child: const Text("ImageCard 위젯 추가"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
