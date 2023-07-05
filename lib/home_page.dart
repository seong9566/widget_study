import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List myList = [
    'A',
    'B',
    'C',
    'D',
  ];

  void updateList(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      // 기존의 List에서 oldIndex에 해당하는 값을 지우고, 그 값을 index에 저장
      final index = myList.removeAt(oldIndex);

      // newIndex에 이전 값을 추가.
      myList.insert(newIndex, index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ReorderableListView 위젯"),
      ),
      body: ReorderableListView(
        children: [
          for (final tile in myList)
            ListTile(
              key: ValueKey(tile),
              title: Text(tile),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          return updateList(oldIndex, newIndex);
        },
      ),
    );
  }
}
