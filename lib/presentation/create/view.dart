import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/components/primary_button.dart';
import 'package:flutter_playground/presentation/create/components/app_bar.dart';
import 'package:flutter_playground/presentation/components/primary_text_field.dart';

part 'view_controller.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({super.key});

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends _CreateTodoViewController {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CreateTaskAppBar(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTextField(
                initialFocus: true,
                placeholder: Strings.description,
                onChanged: setDescription,
              ),
              Spacer(),
              PrimaryButton(
                content: Strings.done,
                onPressed: description.isNotEmpty ? popResult : null,
              ),
              // TODO!: Must be removed after Invalid SafeArea Padding fixed
              SizedBox(height: 78),
            ],
          ),
        ),
      ),
    );
  }
}
