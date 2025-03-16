import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/components/primary_button.dart';
import 'package:flutter_playground/presentation/create/view.dart';
import 'package:flutter_playground/presentation/main/components/app_bar.dart';
import 'package:flutter_playground/presentation/main/components/todo_item.dart';

part 'view_controller.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends _MainViewController {
  @override
  Widget build(BuildContext context) {
    final filteredItems = hideCompleted
        ? items.where((item) {
            return !item.isChecked;
          }).toList()
        : items;

    return CupertinoPageScaffold(
      navigationBar: MainAppBar(
        hideCompleted: hideCompleted,
        toggleHide: toggleHide,
      ),
      child: CupertinoTheme(
        data: CupertinoTheme.of(context).copyWith(
          primaryColor: CupertinoColors.black,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return TodoItem(
                      item: filteredItems[index],
                      toggleCheckTodo: () => toggleCheckTodo(item),
                      removeTodo: () => removeTodo(item),
                    );
                  },
                ),
              ),
              PrimaryButton(
                content: Strings.addTask,
                onPressed: onCreateTodo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
