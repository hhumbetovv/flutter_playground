import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/constants/strings.dart';
import 'package:flutter_playground/presentation/main/bloc.dart';
import 'package:flutter_playground/presentation/main/event.dart';
import 'package:flutter_playground/presentation/main/state.dart';

class MainAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

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
        onPressed: () {
          context.read<MainBloc>().add(MainEvent.toggleHide());
        },
        child: BlocSelector<MainBloc, MainState, bool>(
          selector: (state) => state.hideCompletedTodos,
          builder: (context, hideCompletedTodos) {
            if (kDebugMode) print("Main AppBar Rebuild");

            return Text(
              hideCompletedTodos ? Strings.showCompleted : Strings.hideCompleted,
            );
          },
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
