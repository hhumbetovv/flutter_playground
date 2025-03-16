import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/domain/entities/todo_entity.dart';
import 'package:flutter_playground/presentation/main/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({
    super.key,
    required this.item,
  });

  final TodoEntity item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      onPressed: () {
        ref.read(mainProvider.notifier).toggleCheckTodo(item);
      },
      onLongPress: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  ref.read(mainProvider.notifier).removeTodo(item);
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
