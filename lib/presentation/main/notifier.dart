import 'package:flutter/foundation.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/main/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@riverpod
final class MainNotifier extends _$MainNotifier {
  MainNotifier() : super() {
    if (kDebugMode) print("Main Notifier Created");
  }

  @override
  MainState build() => MainState(items: [], hideCompletedTodos: false);

  void createTodo(String? data) {
    if (data != null) {
      final newTodo = TodoEntity(isChecked: false, data: data);
      state = state.copy(items: [...state.items, newTodo]);
    }
  }

  void toggleHide() {
    state = state.copy(
      hideCompletedItems: !state.hideCompletedTodos,
    );
  }

  void toggleCheckTodo(TodoEntity todo) {
    final updatedItem = todo.copyWith(
      isChecked: !todo.isChecked,
    );

    final updatedItems = state.items.map((todo) {
      if (todo.id == updatedItem.id) {
        return updatedItem;
      }
      return todo;
    }).toList();

    state = state.copy(
      items: updatedItems,
    );
  }

  void removeTodo(TodoEntity todo) {
    final updatedItems = state.items.toList()..remove(todo);

    state = state.copy(items: updatedItems);
  }
}
