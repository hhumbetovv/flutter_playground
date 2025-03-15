import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/main/view_notifier.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hideCompletedTodos = context.select<MainViewNotifier, bool>((notifier) {
      return notifier.hideCompletedTodos;
    });

    if (kDebugMode) print("Main AppBar Rebuild");

    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.transparent,
      leading: Text(
        Strings.title,
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: context.read<MainViewNotifier>().toggleHide,
        child: Text(
          hideCompletedTodos ? Strings.showCompleted : Strings.hideCompleted,
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
