import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/presentation/main/components/todo_item.dart';
import 'package:flutter_playground/presentation/main/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainNotifierProvider);

    final items = state.hideCompletedTodos
        ? state.items.where((item) {
            return !item.isChecked;
          }).toList()
        : state.items;
    if (kDebugMode) print("Todo List Rebuild");

    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TodoItem(
            item: items[index],
          );
        },
      ),
    );
  }
}
