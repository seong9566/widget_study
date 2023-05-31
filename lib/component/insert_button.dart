import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class InsertWidget extends StatefulWidget {
  const InsertWidget({super.key});

  @override
  State<InsertWidget> createState() => _InsertWidget();
}

class _InsertWidget extends State<InsertWidget> {
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

  //TODO: 맵핑된 데이터만 넘어가야함. ex) title : "제목", content: "내용"
  void addContent(String imagePath, String text) {
    // setState(
    //   () {
    //     listCardImages.add(
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Stack(
    //           children: [
    //             SizedBox(
    //               width: 150,
    //               height: 200,
    //               child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(10),
    //                   child: Image.network(
    //                     imagePath,
    //                     fit: BoxFit.cover,
    //                   )),
    //             ),
    //             Positioned(
    //               bottom: 10,
    //               child: Text(
    //                 text,
    //                 style: const TextStyle(
    //                   fontSize: 16,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        openDialog(context: context);
      },
      child: const Text("ImageCard 위젯 추가"),
    );
  }
}
