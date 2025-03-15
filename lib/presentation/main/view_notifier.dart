import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';

final class MainViewNotifier extends ChangeNotifier {
  MainViewNotifier() {
    if (kDebugMode) print("Main View Notifier Created");
  }

  bool _hideCompletedTodos = false;
  bool get hideCompletedTodos => _hideCompletedTodos;

  List<TodoEntity> _items = [];
  UnmodifiableListView<TodoEntity> get items => UnmodifiableListView(_items);

  void createTodo(String? data) async {
    if (data != null) {
      final newTodo = TodoEntity(isChecked: false, data: data);
      _items.add(newTodo);
      notifyListeners();
    }
  }

  void toggleHide() {
    _hideCompletedTodos = !_hideCompletedTodos;
    notifyListeners();
  }

  void toggleCheckTodo(TodoEntity todo) {
    final updatedItem = todo.copyWith(
      isChecked: !todo.isChecked,
    );

    _items = items.map((todo) {
      if (todo.id == updatedItem.id) {
        return updatedItem;
      }
      return todo;
    }).toList();
    notifyListeners();
  }

  void removeTodo(TodoEntity todo) {
    _items.remove(todo);
    notifyListeners();
  }

  @override
  void dispose() {
    if (kDebugMode) print("Main View Notifier Disposed");
    super.dispose();
  }
}
