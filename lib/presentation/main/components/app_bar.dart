import 'package:flutter/cupertino.dart';
import 'package:flutter_playground/constants/strings.dart';

class MainAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.hideCompleted,
    required this.toggleHide,
  });

  final bool hideCompleted;
  final VoidCallback toggleHide;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.transparent,
      leading: Text(
        Strings.title,
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: toggleHide,
        child: Text(
          hideCompleted ? Strings.showCompleted : Strings.hideCompleted,
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
