import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/components/primary_button.dart';
import 'package:flutter_playground/presentation/create/notifier.dart';
import 'package:flutter_playground/presentation/main/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoneButton extends ConsumerWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void popResult() {
      // ! One-time state-reading
      final state = ref.read(createTodoProvider);
      ref.read(mainProvider.notifier).createTodo(state.description);
      Navigator.of(context).pop();
    }

    // ! We must use the select method to avoid rebuilding every time the text changes
    final isEnabled = ref.watch(createTodoProvider.select((state) {
      return state.description.isNotEmpty;
    }));

    if (kDebugMode) print("Done Button Rebuild");

    return PrimaryButton(
      content: Strings.done,
      onPressed: isEnabled ? popResult : null,
    );
  }
}
