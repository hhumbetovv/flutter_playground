import 'package:uuid/uuid.dart';

class TodoEntity {
  final String id;
  final bool isChecked;
  final String data;
  final DateTime date;

  TodoEntity({
    String? id,
    required this.isChecked,
    required this.data,
    DateTime? date,
  })  : id = id ?? Uuid().v4(),
        date = date ?? DateTime.now();

  TodoEntity copyWith({bool? isChecked, String? data, DateTime? date}) {
    return TodoEntity(
      id: id,
      isChecked: isChecked ?? this.isChecked,
      data: data ?? this.data,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'TodoEntity {id=$id, isChecked=$isChecked, data=$data, date=$date }';
  }
}
