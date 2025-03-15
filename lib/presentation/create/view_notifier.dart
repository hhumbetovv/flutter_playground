import 'package:flutter/foundation.dart';

final class CreateTodoViewNotifier extends ChangeNotifier {
  CreateTodoViewNotifier() {
    if (kDebugMode) print("Create Todo View Notifier Created");
  }

  String _description = '';
  String get description => _description;

  void setDescription(String value) {
    _description = value;
    // Triggers all Listeners
    notifyListeners();
  }

  @override
  void dispose() {
    if (kDebugMode) print("Create Todo View Notifier Disposed");
    super.dispose();
  }
}
