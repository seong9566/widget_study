// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import 'widget_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widgets kWidgets = Widgets();
  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

// 나중에 Provider 사용시 필요 setState가 필요 없어짐, 상태값은 Provider로 관리 함.
  void addContent(String imagePath, String text) {
    setState(
      () {
        kWidgets.cachedImageWidgets.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  width: 150,
                  height: 200,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                      )),
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

  void openDialog({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    final ImageProvider? image = await showDialog<ImageProvider>(
      context: context,
      builder: (BuildContext context) {
        String imagePath = '';
        String text = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('이미지와 텍스트 입력'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("이미지 경로 : $imagePath"),
                  TextField(
                    onChanged: (value) {
                      text = value;
                    },
                    decoration: const InputDecoration(
                      labelText: '설명글',
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    final XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
                    imagePath = imageFile?.path ?? '';
                    Logger().d("선택 이미지 경로 : $imagePath");
                    setState(() {});
                  },
                  child: const Text('이미지 추가'), // 이미지 추가 버튼
                ),
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
              kWidgets.containerWidget(),
              const SizedBox(height: 100),
              kWidgets.stackWidget(),
              ElevatedButton(
                onPressed: () {
                  openDialog(context: context);
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
