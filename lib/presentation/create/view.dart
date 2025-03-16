import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/create/components/app_bar.dart';
import 'package:flutter_playground/presentation/components/primary_text_field.dart';
import 'package:flutter_playground/presentation/create/components/done_button.dart';
import 'package:flutter_playground/presentation/create/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ! Must extend ConsumerWidget or ConsumerStatefulWidget to get WidgetRef object
class CreateTodoView extends ConsumerWidget {
  const CreateTodoView({super.key});

  @override
  Widget build(BuildContext parentContext, WidgetRef ref) {
    if (kDebugMode) print("Create Todo View Rebuild");

    return CupertinoPageScaffold(
      navigationBar: CreateTodoAppBar(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTextField(
                initialFocus: true,
                placeholder: Strings.description,
                onChanged: (value) {
                  final notifier = ref.read(createTodoNotifierProvider.notifier);
                  notifier.setDescription(value);
                  // ! Wrong Usage
                  // ! final notifier = ref.watch(createTodoProvider.notifier);
                },
              ),
              Spacer(),
              DoneButton(),
              // TODO!: Must be removed after Invalid SafeArea Padding fixed
              SizedBox(height: 78),
            ],
          ),
        ),
      ),
    );
  }
}
