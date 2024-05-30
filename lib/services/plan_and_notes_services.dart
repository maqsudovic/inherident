import 'package:inherident/model/notes.dart';
import 'package:inherident/model/todo.dart';

class PlanAndNoteService {
  List<Todo> _todos = [];
  List<Note> _notes = [];

  // Todo methods
  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void updateTodo(Todo todo) {
    int index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    }
  }

  void deleteTodo(int id) {
    _todos.removeWhere((t) => t.id == id);
  }

  List<Todo> getTodos() {
    return _todos;
  }

  // Note methods
  void addNote(Note note) {
    _notes.add(note);
  }

  void updateNote(Note note) {
    int index = _notes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      _notes[index] = note;
    }
  }

  void deleteNote(int id) {
    _notes.removeWhere((n) => n.id == id);
  }

  List<Note> getNotes() {
    return _notes;
  }
}