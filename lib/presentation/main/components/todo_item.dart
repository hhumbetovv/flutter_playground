import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.item,
    required this.toggleCheckTodo,
    required this.removeTodo,
  });

  final TodoEntity item;
  final VoidCallback toggleCheckTodo;
  final VoidCallback removeTodo;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      onPressed: toggleCheckTodo,
      onLongPress: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  removeTodo();
                },
                isDestructiveAction: true,
                child: const Text(Strings.delete),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
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
              onChanged: (_) {
                toggleCheckTodo();
              },
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
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
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
