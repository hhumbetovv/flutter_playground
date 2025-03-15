import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.content,
    this.onPressed,
  });

  final String content;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoTheme.of(context).copyWith(
        primaryColor: CupertinoColors.black,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.maxFinite,
          child: CupertinoButton.filled(
            focusColor: CupertinoColors.black,
            onPressed: onPressed,
            child: Text(content),
          ),
        ),
      ),
    );
  }
}
