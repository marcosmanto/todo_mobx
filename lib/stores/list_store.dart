import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

// ignore: library_private_types_in_public_api
class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = '';
  @observable
  List<String> todoList = [];

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;
  @action
  void addTodo() {
    // we need to change the object to observable see the change
    todoList = List.from(todoList..add(newTodoTitle));
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
