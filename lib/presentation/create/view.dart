import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/create/components/app_bar.dart';
import 'package:flutter_playground/presentation/components/primary_text_field.dart';
import 'package:flutter_playground/presentation/create/components/done_button.dart';
import 'package:flutter_playground/presentation/create/view_notifier.dart';
import 'package:provider/provider.dart';

class CreateTodoView extends StatelessWidget {
  const CreateTodoView({super.key});

  @override
  Widget build(BuildContext parentContext) {
    // ! Creating and Injecting Lifecycle Aware Notifier Object to Child Context
    return ChangeNotifierProvider(
      create: (_) => CreateTodoViewNotifier(),
      // ! Wrap with Builder to get injected new context for usage
      child: Builder(builder: (injectedContext) {
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
                      final notifier = injectedContext.read<CreateTodoViewNotifier>();
                      notifier.setDescription(value);
                      // ? Alternative Usage
                      // ? final notifier = Provider.of<CreateTodoViewNotifier>(injectedContext, listen: false);
                      // ! Wrong Usage
                      // ! final notifier = Provider.of<CreateTodoViewNotifier>(parentContext, listen: false);
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
      }),
    );
  }
}
