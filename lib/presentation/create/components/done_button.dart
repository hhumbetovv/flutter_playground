import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/components/primary_button.dart';
import 'package:flutter_playground/presentation/create/view_notifier.dart';
import 'package:provider/provider.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    void popResult() {
      final notifier = context.read<CreateTodoViewNotifier>();
      Navigator.of(context).pop(notifier.description);
    }

    return Selector<CreateTodoViewNotifier, bool>(
      selector: (context, notifier) => notifier.description.isNotEmpty,
      builder: (context, isEnabled, child) {
        if (kDebugMode) print("Done Button Rebuild");

        return PrimaryButton(
          content: Strings.done,
          onPressed: isEnabled ? popResult : null,
        );
      },
    );
  }
}
