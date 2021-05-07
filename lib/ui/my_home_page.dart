
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {

//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('할 일 목록'),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.delete_forever),
//               onPressed: this._promptRemoveAllTodoItem),
//         ],
//       ),
//       // ignore: missing_required_param
//       body: ListView.builder(
//         itemBuilder: (context, position) {
//           return Column(
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Padding(
//                         padding:
//                         const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
//                         child: Text(
//                           todolist[position],
//                           style: TextStyle(
//                               fontSize: 22.0, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                         const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
//                         child: Text(
//                           todolist[position],
//                           style: TextStyle(fontSize: 18.0),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Divider(
//                 height: 2.0,
//                 color: Colors.grey,
//               )
//             ],
//           );
//         },
//         itemCount: todolist.length,
//       ),
//
//
//       floatingActionButton: new FloatingActionButton(
//           onPressed: _addTask, // pressing this button now opens the new screen
//           tooltip: 'Add task',
//           child: new Icon(Icons.add)),
//     );
//   }
//
//   void _addTask() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => AddTodoScreen(context)),
//     );
//     if (result) {
//       setState(() {
//         todolist();
//       });
//     }
//   }
//
//   void _promptRemoveAllTodoItem() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return new AlertDialog(
//               title: new Text('Clear Todo List?'),
//               actions: <Widget>[
//                 new ElevatedButton(
//                     child: new Text('CANCEL'),
//                     onPressed: () => Navigator.of(context).pop()),
//                 new ElevatedButton(
//                     child: new Text('CLEAR'),
//                     onPressed: () {
//                       _removeAllTodoItem();
//                       Navigator.of(context).pop();
//                     })
//               ]);
//         });
//   }
//   void _removeAllTodoItem() {
//     setState(() {
//       todolist.clear();
//
//     });
//   }
// }
//
// class todo {
// }
