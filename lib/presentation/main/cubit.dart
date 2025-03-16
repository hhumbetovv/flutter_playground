import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/main/state.dart';

final class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(items: [], hideCompletedTodos: false)) {
    if (kDebugMode) print("Main Cubit Created");
  }

  void createTodo(String? data) {
    if (data != null) {
      final newTodo = TodoEntity(isChecked: false, data: data);
      emit(state.copy(items: [...state.items, newTodo]));
    }
  }

  void toggleHide() {
    emit(state.copy(
      hideCompletedItems: !state.hideCompletedTodos,
    ));
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

    emit(state.copy(
      items: updatedItems,
    ));
  }

  void removeTodo(TodoEntity todo) {
    final updatedItems = state.items..remove(todo);

    emit(state.copy(
      items: updatedItems,
    ));
  }

  @override
  Future<void> close() {
    if (kDebugMode) print("Main Cubit Closed");
    return super.close();
  }
}
