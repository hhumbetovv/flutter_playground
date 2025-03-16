import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';

class CreateTodoAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const CreateTodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(Strings.task),
      transitionBetweenRoutes: false,
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: Navigator.of(context).pop,
        child: IntrinsicWidth(
          child: Row(
            children: [
              Icon(CupertinoIcons.chevron_back),
              Text(Strings.close),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kMinInteractiveDimensionCupertino);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.a == 0xFF;
  }
}
