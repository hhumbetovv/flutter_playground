import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/main/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainAppBar extends ConsumerWidget implements ObstructingPreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideCompletedTodos = ref.watch(mainProvider.select((state) {
      return state.hideCompletedTodos;
    }));

    if (kDebugMode) print("Main AppBar Rebuild");
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.transparent,
      leading: Text(
        Strings.title,
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          ref.read(mainProvider.notifier).toggleHide();
        },
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
