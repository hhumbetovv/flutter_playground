import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/presentation/main/components/todo_item.dart';
import 'package:flutter_playground/presentation/main/view_notifier.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MainViewNotifier>();

    final items = notifier.hideCompletedTodos
        ? notifier.items.where((item) {
            return !item.isChecked;
          }).toList()
        : notifier.items;
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
