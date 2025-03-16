import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/presentation/create/state.dart';

final class CreateTodoCubit extends Cubit<CreateTodoState> {
  CreateTodoCubit() : super(CreateTodoState(description: '')) {
    if (kDebugMode) print("Create Todo Cubit Created");
  }

  void setDescription(String description) {
    emit(state.copy(description: description));
  }

  @override
  Future<void> close() {
    if (kDebugMode) print("Create Todo Cubit Closed");
    return super.close();
  }
}
