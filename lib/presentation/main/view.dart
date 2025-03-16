import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/main/notifier.dart';
import 'package:flutter_playground/presentation/main/components/add_todo_button.dart';
import 'package:flutter_playground/presentation/main/components/app_bar.dart';
import 'package:flutter_playground/presentation/main/components/todo_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      mainNotifierProvider.select((value) {
        return value.items;
      }),
      (previous, next) {
        if ((previous?.length ?? 0) > next.length) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(Strings.taskRemoved),
            ),
          );
        }
      },
    );
    return CupertinoPageScaffold(
      navigationBar: MainAppBar(),
      child: CupertinoTheme(
        data: CupertinoTheme.of(context).copyWith(
          primaryColor: CupertinoColors.black,
        ),
        child: SafeArea(
          child: Column(
            children: [
              TodoList(),
              AddTodoButton(),
            ],
          ),
        ),
      ),
    );
  }
}
