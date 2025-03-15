import 'package:flutter/cupertino.dart';

part 'primary_text_field_controller.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.initialFocus = false,
  });

  final String placeholder;
  final bool initialFocus;
  final ValueChanged<String> onChanged;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends _PrimaryTextFieldController {
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      focusNode: focusNode,
      maxLines: null,
      placeholder: widget.placeholder,
      clearButtonMode: OverlayVisibilityMode.editing,
      enableSuggestions: true,
      onChanged: widget.onChanged,
      decoration: BoxDecoration(
        color: CupertinoColors.transparent,
        border: Border(
          bottom: BorderSide(
            color: hasFocus ? CupertinoTheme.of(context).primaryColor : CupertinoColors.inactiveGray,
          ),
        ),
      ),
    );
  }
}
