import 'package:flutter/material.dart';
import 'package:todoapp/utils/todo_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _controller= TextEditingController();

  List todolist = [
    ['Wake up', false],
    ['Brush your teeth', false],
    ['Breakfast', false],
    ['Work on my pro project', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todolist[index][1] =! todolist[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todolist.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '🌸ToDo by Venus🌸'
        ),
        backgroundColor: Colors.deepPurple.shade100,
        foregroundColor: Colors.deepPurple.shade800,
      ),

      body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (BuildContext context, index) {
            return ToDoList(
              taskName: todolist[index][0],
              taskCompleted: todolist[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (context) => deleteTask(index),
            );
      }),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20
              ),

              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new todo item...',

                  filled: true,

                  fillColor: Colors.deepPurple.shade200,

                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.deepPurple,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.deepPurple,
                    ),

                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            )),

            FloatingActionButton(
                onPressed: saveNewTask,
                child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
