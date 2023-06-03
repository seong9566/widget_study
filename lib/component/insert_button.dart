import 'package:d0t/home_page.dart';
import 'package:d0t/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

/*
2023-06-03
TODO:
1. dropdown버튼 구현
2. 선택지로 ListWidget,StackWidget,ContainerWidget
3. 선택 시 textfield로 setState로 입력 폼 구현
4. 등록 버튼 시 화면에 생성

각 함수의 역할
openDialog : 이미지 카드를 추가하는 기능 (파일 선택)
addContent(img, content만 넘겨주도록 수정 필요) : 이미지를 선택했을때 동적으로 그림을 다시 그려주고, List를 업데이트 하는 역할
selectedWidget : 위젯을 선택 및 추가 
 */

class InsertWidget extends StatefulWidget {
  InsertWidget({required this.widgetList, required this.onWidgetAdd, Key? key})
      : super(key: key);
  List<Widget>? widgetList;
  final VoidCallback onWidgetAdd;
  @override
  State<InsertWidget> createState() => _InsertWidget();
}

class _InsertWidget extends State<InsertWidget> {
  String _selectedValue = 'Container';

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
                    final XFile? imageFile =
                        await picker.pickImage(source: ImageSource.gallery);
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

  void addContent(String imagePath, String text) {
    setState(
      () {},
    );
  }

  // showDialog는 독립적인 context에서 위젯 트리를 생성한다 그러므로 부모의 setState는 적용이 되지않기때문에
  // StatefulBuilder를 사용해서 업데이트를 해주어야한다.
  void selectedWidget(BuildContext context, List<String> dropDownButtonItems,
      List<Widget> widgetList) {
    showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                title: const Text('사용할 위젯을 선택하세요.'),
                // dropdown박스 구현하기.
                content: DropdownButton(
                  value: _selectedValue,
                  items: dropDownButtonItems
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                      Logger().d("selected : ${_selectedValue}");
                    });
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => {
                      if (_selectedValue == "Container")
                        {
                          widgetList.add(ContainerWidget()),
                        }
                      else if (_selectedValue == "Stack")
                        {
                          widgetList.add(StackWidget()),
                        }
                      else
                        {
                          widgetList.add(ListWidget()),
                        },
                      Logger().d("위젯 확인 : ${widgetList.length}"),
                      widget.onWidgetAdd(),
                      Navigator.pop(context, 'OK'),
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = widget.widgetList!;
    List<String> dropDownButtonItems = <String>["Container", "Stack", "List"];
    return ElevatedButton(
      onPressed: () => selectedWidget(context, dropDownButtonItems, widgetList),
      child: const Text('위젯 추가'),
    );
  }
}
