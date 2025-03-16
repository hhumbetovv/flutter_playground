final class CreateTodoState {
  final String description;

  CreateTodoState({
    required this.description,
  });

  CreateTodoState copy({
    String? description,
  }) {
    return CreateTodoState(
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(covariant CreateTodoState other) {
    if (identical(this, other)) return true;

    return other.description == description;
  }

  @override
  int get hashCode => description.hashCode;

  @override
  String toString() {
    return 'CreateTodoState { description=$description }';
  }
}
