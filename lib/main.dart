import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.orange
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My TODO's"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (
          BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Text("Add Todolist"),
              content: TextField(
                onChanged: (String value){
                  input = value;
            },
          ),
          actions: [ElevatedButton(onPressed: (){
            setState(() {
              todos.add(input);
            }); 
            Navigator.pop(context);
          }, child: Text("Add"))],
        );
        });
      },
      child: Icon(Icons.add,color: Colors.white),),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (
          BuildContext context, int index){
            return Container(
              key: UniqueKey(), child: Card(
                elevation: 10,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete,),
                    onPressed: (){
                      setState(() {
                        todos.removeAt(index);
                      });
                  },),
                ),
        ));
      }) 
    );
  }
}
