import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

// ignore: library_private_types_in_public_api
class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  final String title;
  _TodoStore({required this.title});

  @observable
  bool done = false;

  @action
  void toggleDone() => done = !done;
}
