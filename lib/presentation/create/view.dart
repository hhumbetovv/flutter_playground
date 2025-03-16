import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/create/bloc.dart';
import 'package:flutter_playground/presentation/create/components/app_bar.dart';
import 'package:flutter_playground/presentation/components/primary_text_field.dart';
import 'package:flutter_playground/presentation/create/components/done_button.dart';
import 'package:flutter_playground/presentation/create/event.dart';

class CreateTodoView extends StatelessWidget {
  const CreateTodoView({super.key});

  @override
  Widget build(BuildContext parentContext) {
    // ! Creating and Injecting Lifecycle Aware Bloc Object to Child Context
    return BlocProvider<CreateTodoBloc>(
      create: (_) => CreateTodoBloc(),
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
                      final bloc = injectedContext.read<CreateTodoBloc>();
                      bloc.add(CreateTodoEvent.setDescription(value));
                      // ? Alternative Usage
                      // ? final bloc = BlocProvider.of<CreateTodoBloc>(injectedContext);
                      // ! Wrong Usage
                      // ! final bloc = BlocProvider.of<CreateTodoBloc>(parentContext);
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
