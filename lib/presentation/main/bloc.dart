import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/main/event.dart';
import 'package:flutter_playground/presentation/main/state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState(items: [], hideCompletedTodos: false)) {
    if (kDebugMode) print("Main Bloc Created");

    on<MainCreateTodo>((event, emit) {
      if (event.data != null) {
        final newTodo = TodoEntity(isChecked: false, data: event.data!);
        emit(state.copy(items: [...state.items, newTodo]));
      }
    });

    on<MainToggleHide>((event, emit) {
      emit(state.copy(
        hideCompletedItems: !state.hideCompletedTodos,
      ));
    });

    on<MainToggleCheckTodo>((event, emit) {
      final updatedItem = event.todo.copyWith(
        isChecked: !event.todo.isChecked,
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
    });

    on<MainRemoveTodo>((event, emit) {
      final updatedItems = state.items.toList()..remove(event.todo);

      emit(state.copy(
        items: updatedItems,
      ));
    });
  }

  @override
  Future<void> close() {
    if (kDebugMode) print("Main Bloc Closed");
    return super.close();
  }
}
