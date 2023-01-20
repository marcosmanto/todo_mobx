import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';

part 'list_store.g.dart';

// ignore: library_private_types_in_public_api
class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = '';

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;
  @action
  void addTodo() {
    // add to the bottom
    //todoList.add(TodoStore(title: newTodoTitle));
    // add to the top
    todoList.insert(0, TodoStore(title: newTodoTitle));
    newTodoTitle = '';
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
