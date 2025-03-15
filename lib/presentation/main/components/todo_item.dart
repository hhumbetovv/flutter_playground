import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/main/view_notifier.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.item,
  });

  final TodoEntity item;

  @override
  Widget build(BuildContext parentContext) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      onPressed: () {
        parentContext.read<MainViewNotifier>().toggleCheckTodo(item);
      },
      onLongPress: () {
        showCupertinoModalPopup(
          context: parentContext,
          // ! ignore the context in the bottom line, because it creates
          // ! a new context (this context does not contain our notifier)
          builder: (contextWhichMustIgnored) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(parentContext);
                  // ? we use the context of the tree where our notifier is injected
                  parentContext.read<MainViewNotifier>().removeTodo(item);
                  // * we will get provider not found error when we use this context
                  // * contextWhichMustIgnored.read<MainViewNotifier>().removeTodo(item);
                },
                isDestructiveAction: true,
                child: const Text(Strings.delete),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(parentContext);
              },
              child: const Text(Strings.cancel),
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Transform.scale(
            scale: 1.4,
            child: CupertinoCheckbox(
              activeColor: CupertinoColors.black,
              value: item.isChecked,
              onChanged: null,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  item.data,
                  style: CupertinoTheme.of(parentContext).textTheme.textStyle.copyWith(
                        fontSize: 16,
                        color: item.isChecked ? CupertinoColors.separator : null,
                        decoration: item.isChecked ? TextDecoration.lineThrough : null,
                      ),
                ),
                Text(
                  item.date.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: item.isChecked ? CupertinoColors.separator : CupertinoColors.inactiveGray,
                    decoration: item.isChecked ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
