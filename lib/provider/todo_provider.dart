
import 'package:flutter/foundation.dart';
import 'package:flutter_todo/model/todo_list.dart';

class AppProvider with ChangeNotifier{

  final List<TodoList> _personList =[];

  List<TodoList> get personList => _personList;

  void todoList(TodoList todoModel){
    _personList.add(todoModel);
    notifyListeners();
  }

  void todoListRemove(TodoList todoModel){
    final index = _personList.indexOf(todoModel);
    
    _personList.removeAt(index);
    notifyListeners();
  }


}