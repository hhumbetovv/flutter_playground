part of 'view.dart';

abstract class _CreateTodoViewController extends State<CreateTodoView> {
  String description = '';

  void setDescription(String value) {
    setState(() {
      description = value;
    });
  }

  void popResult() {
    Navigator.of(context).pop(description);
  }
}
