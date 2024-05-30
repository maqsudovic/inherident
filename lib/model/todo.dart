class Todo {
  int id;
  String title;
  String description;
  DateTime date;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
  });
}