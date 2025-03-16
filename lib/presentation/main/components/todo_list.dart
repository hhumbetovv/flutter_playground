import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/presentation/main/cubit.dart';
import 'package:flutter_playground/presentation/main/components/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MainCubit>();

    final items = cubit.state.hideCompletedTodos
        ? cubit.state.items.where((item) {
            return !item.isChecked;
          }).toList()
        : cubit.state.items;
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
