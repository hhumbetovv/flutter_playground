part of 'primary_text_field.dart';

abstract class _PrimaryTextFieldController extends State<PrimaryTextField> {
  late final focusNode = FocusNode();
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(focusListener);
    if (widget.initialFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        focusNode.requestFocus();
      });
    }
  }

  void focusListener() {
    setState(() {
      hasFocus = focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    focusNode
      ..removeListener(focusListener)
      ..dispose();
    super.dispose();
  }
}
