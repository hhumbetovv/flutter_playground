import 'package:flutter_playground/domain/entities/todo_entity.dart';

sealed class MainEvent {
  const MainEvent();

  const factory MainEvent.createTodo(String? data) = MainCreateTodo;
  const factory MainEvent.toggleHide() = MainToggleHide;
  const factory MainEvent.toggleCheckTodo(TodoEntity todo) = MainToggleCheckTodo;
  const factory MainEvent.removeTodo(TodoEntity todo) = MainRemoveTodo;
}

final class MainCreateTodo extends MainEvent {
  const MainCreateTodo(this.data);

  final String? data;
}

final class MainToggleHide extends MainEvent {
  const MainToggleHide();
}

final class MainToggleCheckTodo extends MainEvent {
  const MainToggleCheckTodo(this.todo);

  final TodoEntity todo;
}

final class MainRemoveTodo extends MainEvent {
  const MainRemoveTodo(this.todo);

  final TodoEntity todo;
}
