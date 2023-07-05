import 'package:flutter/material.dart';

class ReorderViewWidget extends StatefulWidget {
  const ReorderViewWidget({super.key});

  @override
  State<ReorderViewWidget> createState() => _ReorderViewWidgetState();
}

class _ReorderViewWidgetState extends State<ReorderViewWidget> {
  final List myList = ['A', 'B', 'C', 'D'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        children: [
          for (final dList in myList)
            ListTile(
              key: ValueKey(dList),
              title: Text(dList),
            ),
        ],
        onReorder: (oldIndex, newIndex) {},
      ),
    );
  }
}
