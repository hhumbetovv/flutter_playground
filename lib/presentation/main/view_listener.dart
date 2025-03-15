import 'package:flutter/material.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/main/view_notifier.dart';
import 'package:provider/provider.dart';

class MainViewListener extends StatefulWidget {
  const MainViewListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainViewListener> createState() => _MainViewListeItemsnerState();
}

class _MainViewListeItemsnerState extends State<MainViewListener> {
  List<TodoEntity> oldItems = [];

  @override
  void initState() {
    super.initState();
    context.read<MainViewNotifier>().addListener(() {
      final newItems = context.read<MainViewNotifier>().items;
      if (newItems.length > oldItems.length) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(Strings.todoCreated),
          ),
        );
        oldItems = [...newItems];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
