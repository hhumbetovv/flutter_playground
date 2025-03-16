import 'package:flutter/foundation.dart';

import 'package:flutter_playground/domain/entities/todo_entity.dart';

class MainState {
  final List<TodoEntity> items;
  final bool hideCompletedTodos;

  MainState({required this.items, required this.hideCompletedTodos});

  @override
  String toString() {
    return 'MainState { items=$items, hideCompletedItems=$hideCompletedTodos }';
  }

  @override
  bool operator ==(covariant MainState other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items) && other.hideCompletedTodos == hideCompletedTodos;
  }

  @override
  int get hashCode => items.hashCode ^ hideCompletedTodos.hashCode;

  MainState copy({
    List<TodoEntity>? items,
    bool? hideCompletedItems,
  }) {
    return MainState(
      items: items ?? this.items,
      hideCompletedTodos: hideCompletedItems ?? this.hideCompletedTodos,
    );
  }
}
