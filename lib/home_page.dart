import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/todo_provider.dart';
import 'package:flutter_todo/style/style.dart';
import 'package:flutter_todo/model/todo_list.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoList> todos = [];
  final TextEditingController _nameEditController = TextEditingController();
  final TextEditingController _emailEditController = TextEditingController();
  final TextEditingController _phoneEditController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                todos.clear();
                if (mounted) {
                  setState(() {});
                }
              },
              icon: const Icon(Icons.playlist_remove),
            ),
          ),
        ],
        title: const Text('Add Todo'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, _) => ListView.separated(
          itemCount: provider.personList.length,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 6,
              color: Colors.white,
            );
          },
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                provider.personList[index].name,
                style: headTextStyle(),
              ),
              trailing: IconButton(
                onPressed: () {
                  provider.personList.removeAt(index);
                  if (mounted) {
                    setState(() {});
                  }
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.personList[index].email,
                    style: subTitel(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    provider.personList[index].phone,
                    style: subTitel(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNewToDo();
          },
          child: const Icon(Icons.add)),
    );
  }

  void addNewToDo() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add  Todo",
                      style: headTextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _nameEditController,
                      keyboardType: TextInputType.name,
                      decoration: appInputStyle('Name'),
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter Your First Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<AppProvider>(
                      builder: (context, provider, _) => SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: buttonStyle(),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  provider.todoList(
                                    TodoList(
                                      name: _nameEditController.text.trim(),
                                      email: _emailEditController.text.trim(),
                                      phone: _phoneEditController.text.trim(),
                                      isDone: false,
                                    ),
                                  );

                                  _phoneEditController.clear();
                                  _nameEditController.clear();
                                  _emailEditController.clear();

                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Add')),
                        ),
                      ),

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
