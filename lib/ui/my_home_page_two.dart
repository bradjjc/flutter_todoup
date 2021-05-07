import 'package:flutter/material.dart';

class MyHomePageTwo extends StatefulWidget {
  const MyHomePageTwo({Key key}) : super(key: key);

  @override
  _MyHomePageTwoState createState() => _MyHomePageTwoState();
}

class _MyHomePageTwoState extends State<MyHomePageTwo> {
  List<String> items = [
    '111',
    '222',
    '333',
  ];
  final Set<int> checkedIndexes = {};
  bool isDeleteMode = false;
  final _textController = TextEditingController();
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  List<Widget> normalModeActions = [];
  List<Widget> deleteModeActions = [];
  @override
  void initState() {
    super.initState();
    normalModeActions = [
      IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isDeleteMode = true;
          });
        },
      ),
    ];
    deleteModeActions = [
      IconButton(
        icon: Icon(
          Icons.cancel,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isDeleteMode = false;
            checkedIndexes.clear();
          });
        },
      ),
      IconButton(
        icon: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isDeleteMode = false;
            items = items
                .asMap()
                .entries
                .where((e) => !checkedIndexes.contains(e.key))
                .map((e) => e.value)
                .toList();
            checkedIndexes.clear();
          });
        },
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('할 일 목록'),
        actions: isDeleteMode ? deleteModeActions : normalModeActions,
      ),
      body: ListView(
        children: items
            .asMap()
            .entries
            .map((e) => ListTile(
            leading: isDeleteMode
                ? Checkbox(
              onChanged: (bool value) {
                setState(() {
                  if (value) {
                    checkedIndexes.add(e.key);
                  } else {
                    checkedIndexes.remove(e.key);
                  }
                });
              },
              value: checkedIndexes.contains(e.key),
            )
                : null,
            title: Text(e.value)))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void _addTodo(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('할 일'),
            content: TextField(
              controller: _textController,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_textController.text.isEmpty){
                      return;
                    }
                    setState(() {
                      items.add(_textController.text);
                      _textController.text = '';
                    });
                    Navigator.pop(context);
                  },
                  child: Text('추가')),
            ],
          );
        });
  }
}


