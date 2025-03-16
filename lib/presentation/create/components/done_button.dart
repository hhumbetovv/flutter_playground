import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/components/primary_button.dart';
import 'package:flutter_playground/presentation/create/cubit.dart';
import 'package:flutter_playground/presentation/create/state.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    void popResult() {
      final cubit = context.read<CreateTodoCubit>();
      Navigator.of(context).pop(cubit.state.description);
    }

    return BlocSelector<CreateTodoCubit, CreateTodoState, bool>(
      selector: (state) => state.description.isNotEmpty,
      builder: (context, isEnabled) {
        if (kDebugMode) print("Done Button Rebuild");

        return PrimaryButton(
          content: Strings.done,
          onPressed: isEnabled ? popResult : null,
        );
      },
    );
  }
}
