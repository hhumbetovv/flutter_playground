import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/main/bloc.dart';
import 'package:flutter_playground/presentation/main/components/add_todo_button.dart';
import 'package:flutter_playground/presentation/main/components/app_bar.dart';
import 'package:flutter_playground/presentation/main/components/todo_list.dart';
import 'package:flutter_playground/presentation/main/state.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocListener<MainBloc, MainState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(Strings.taskRemoved),
            ),
          );
        },
        listenWhen: (previous, current) {
          return previous.items.length > current.items.length;
        },
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
