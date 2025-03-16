import 'package:flutter/foundation.dart';
import 'package:flutter_playground/presentation/create/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class CreateTodoNotifier extends StateNotifier<CreateTodoState> {
  CreateTodoNotifier() : super(CreateTodoState(description: '')) {
    if (kDebugMode) print("Create Todo Notifier Created");
  }

  void setDescription(String description) {
    state = state.copy(description: description);
  }

  @override
  void dispose() {
    if (kDebugMode) print("Create Todo Notifier Disposed");

    super.dispose();
  }
}

final createTodoProvider = StateNotifierProvider<CreateTodoNotifier, CreateTodoState>((ref) {
  return CreateTodoNotifier();
});
