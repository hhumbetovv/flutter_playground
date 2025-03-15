// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return 'TodoEntity { id=$id, isChecked=$isChecked, data=$data, date=$date }';
  }

  @override
  int get hashCode {
    return id.hashCode ^ isChecked.hashCode ^ data.hashCode ^ date.hashCode;
  }

  @override
  bool operator ==(covariant TodoEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.isChecked == isChecked && other.data == data && other.date == date;
  }
}
