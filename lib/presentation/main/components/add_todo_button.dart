import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/components/primary_button.dart';
import 'package:flutter_playground/presentation/create/view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodoButton extends ConsumerWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      content: Strings.addTask,
      onPressed: () async {
        Navigator.of(context).push(CupertinoSheetRoute<String>(
          settings: RouteSettings(name: "create-task"),
          builder: (context) {
            return CreateTodoView();
          },
        ));
      },
    );
  }
}
