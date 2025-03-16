import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/presentation/create/event.dart';
import 'package:flutter_playground/presentation/create/state.dart';

final class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc() : super(CreateTodoState(description: '')) {
    if (kDebugMode) print("Create Todo Bloc Created");

    on<CreateTodoSetDescription>((event, emit) {
      emit(state.copy(
        description: event.description,
      ));
    });
  }

  @override
  Future<void> close() {
    if (kDebugMode) print("Create Todo Bloc Closed");
    return super.close();
  }
}
