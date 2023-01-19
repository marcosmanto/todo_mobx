import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

// ignore: library_private_types_in_public_api
class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = '';

  ObservableList<String> todoList = ObservableList<String>();

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;
  @action
  void addTodo() {
    todoList.add(newTodoTitle);
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
