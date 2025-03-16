sealed class CreateTodoEvent {
  const CreateTodoEvent();

  const factory CreateTodoEvent.setDescription(
    String description,
  ) = CreateTodoSetDescription;
}

final class CreateTodoSetDescription extends CreateTodoEvent {
  const CreateTodoSetDescription(this.description);

  final String description;
}
