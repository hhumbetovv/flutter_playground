part of 'view.dart';

abstract class _MainViewController extends State<MainView> {
  UnmodifiableListView<TodoEntity> items = UnmodifiableListView([]);
  bool hideCompleted = false;

  void onCreateTodo() async {
    final result = await Navigator.of(context).push(CupertinoSheetRoute<String>(
      settings: RouteSettings(name: "create-task"),
      builder: (context) {
        return CreateTodoView();
      },
    ));
    if (result != null) {
      final newTodo = TodoEntity(isChecked: false, data: result);
      setState(() {
        items = UnmodifiableListView([...items, newTodo]);
      });
    }
  }

  void toggleHide() {
    setState(() {
      hideCompleted = !hideCompleted;
    });
  }

  void toggleCheckTodo(TodoEntity item) {
    final updatedItem = item.copyWith(
      isChecked: !item.isChecked,
    );

    final updatedItems = items.map((element) {
      if (element.id == updatedItem.id) {
        return updatedItem;
      }
      return element;
    });

    setState(() {
      items = UnmodifiableListView(updatedItems);
    });
  }

  void removeTodo(TodoEntity item) {
    setState(() {
      items = UnmodifiableListView(
        items.toList()..remove(item),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(Strings.taskRemoved)),
    );
  }
}
