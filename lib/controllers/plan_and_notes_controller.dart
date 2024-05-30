import 'package:inherident/model/notes.dart';
import 'package:inherident/model/todo.dart';

import '../services/plan_and_notes_services.dart';

class PlanAndNoteController {
  final PlanAndNoteService _service = PlanAndNoteService();

  // Todo methods
  void addTodo(Todo todo) {
    _service.addTodo(todo);
  }

  void updateTodo(Todo todo) {
    _service.updateTodo(todo);
  }

  void deleteTodo(int id) {
    _service.deleteTodo(id);
  }

  List<Todo> getTodos() {
    return _service.getTodos();
  }

  // Note methods
  void addNote(Note note) {
    _service.addNote(note);
  }

  void updateNote(Note note) {
    _service.updateNote(note);
  }

  void deleteNote(int id) {
    _service.deleteNote(id);
  }

  List<Note> getNotes() {
    return _service.getNotes();
  }
}
