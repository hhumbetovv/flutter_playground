import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/components/primary_button.dart';
import 'package:flutter_playground/presentation/create/view.dart';
import 'package:flutter_playground/presentation/main/view_notifier.dart';
import 'package:provider/provider.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      content: Strings.addTask,
      onPressed: () async {
        final result = await Navigator.of(context).push(CupertinoSheetRoute<String>(
          settings: RouteSettings(name: "create-task"),
          builder: (context) {
            return CreateTodoView();
          },
        ));
        // ! We need to check is context is mounted or not
        // ! because the screen can be exited until await is finished,
        // ! at which time the notifier will be dispose if the context is unmounted
        if (!context.mounted) return;
        context.read<MainViewNotifier>().createTodo(result);
      },
    );
  }
}
