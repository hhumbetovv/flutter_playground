import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/presentation/main/components/add_todo_button.dart';
import 'package:flutter_playground/presentation/main/components/app_bar.dart';
import 'package:flutter_playground/presentation/main/components/todo_list.dart';
import 'package:flutter_playground/presentation/main/view_listener.dart';
import 'package:flutter_playground/presentation/main/view_notifier.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainViewNotifier(),
      child: MainViewListener(
        child: CupertinoPageScaffold(
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
        ),
      ),
    );
  }
}
