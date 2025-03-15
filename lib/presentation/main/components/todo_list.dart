import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/main/components/todo_item.dart';
import 'package:flutter_playground/presentation/main/view_notifier.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MainViewNotifier, List<TodoEntity>>(
      shouldRebuild: (previous, next) {
        return !listEquals(previous, next);
      },
      selector: (context, notifier) {
        return notifier.hideCompletedTodos
            ? notifier.items.where((item) {
                return !item.isChecked;
              }).toList()
            : notifier.items;
      },
      builder: (BuildContext context, List<TodoEntity> items, Widget? child) {
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
      },
    );
  }
}
