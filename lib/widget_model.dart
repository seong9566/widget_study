// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

/*
TODO

enum -> freezed 
1. 위젯 분리
2. 위젯 변수화
3. 위젯 관리
*/

const FontWeight fWeight = FontWeight.bold;
const double fTitleSize = 24;
const double fContentSize = 16;
const double fHeight = 400;
const double fWidth = 600;

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
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
}

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  // 나중에 Provider 사용시 필요 setState가 필요 없어짐, 상태값은 Provider로 관리 함.

  @override
  Widget build(BuildContext context) {
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
        // Positioned(
        //   bottom: 16,
        //   child: ListWidget(),
        // ),
      ],
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  //final List<String> listCardImages = [];
  Map<String, List<String>> listCardItems = {
    "title": ["test1", "test2", "test3"],
    "img": ["assets/image1.jpeg", "assets/image2.jpeg", "assets/image3.jpeg"],
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 변수화
      width: fWidth, // 리스트 뷰의 크기
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  // 사진의 크기
                  width: 150,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      listCardItems["img"]![index].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    //listCardImages[index].text,
                    listCardItems["title"]![index].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
