import 'package:flutter/foundation.dart';
import 'package:flutter_playground/presentation/create/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier.g.dart';

@riverpod
final class CreateTodoNotifier extends _$CreateTodoNotifier {
  CreateTodoNotifier() {
    if (kDebugMode) print("Create Todo Notifier Created");
  }

  @override
  CreateTodoState build() => CreateTodoState(description: '');

  void setDescription(String description) {
    state = state.copy(description: description);
  }
}
