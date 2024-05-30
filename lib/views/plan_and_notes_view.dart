import 'package:flutter/material.dart';
import 'package:inherident/controllers/plan_and_notes_controller.dart';
import 'package:inherident/model/notes.dart';
import 'package:inherident/model/todo.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PlanAndNoteController _controller = PlanAndNoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plans and Notes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Plans and Reminders',
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showPlanAndNoteModal();
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Plans'),
                        SizedBox(height: 8.0),
                        Expanded(
                          child: _buildPlansList(),
                        ),
                        SizedBox(height: 16.0),
                        Text('Reminders'),
                        SizedBox(height: 8.0),
                        Expanded(
                          child: _buildNotesList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPlanAndNoteModal();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showPlanAndNoteModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Plans'),
                Tab(text: 'Reminders'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildPlansList(),
                  _buildNotesList(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Add new plan or reminder
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlansList() {
    return ListView.builder(
      itemCount: _controller.getTodos().length,
      itemBuilder: (context, index) {
        Todo todo = _controller.getTodos()[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: Checkbox(
            value: todo.isCompleted,
            onChanged: (value) {
              todo.isCompleted = value!;
              _controller.updateTodo(todo);
              setState(() {});
            },
          ),
          onTap: () {
            // Edit plan
            _editPlan(todo);
          },
          onLongPress: () {
            // Delete plan
            _deletePlan(todo);
          },
        );
      },
    );
  }

  Widget _buildNotesList() {
    return ListView.builder(
      itemCount: _controller.getNotes().length,
      itemBuilder: (context, index) {
        Note note = _controller.getNotes()[index];
        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          onTap: () {
            _editNote(note);
          },
          onLongPress: () {
            _deleteNote(note);
          },
        );
      },
    );
  }

  void _editPlan(Todo todo) {
    // Edit plan
    _controller.updateTodo(todo);
    setState(() {});
  }

  void _deletePlan(Todo todo) {
    _controller.deleteTodo(todo.id);
    setState(() {});
  }

  void _editNote(Note note) {
  }

  void _deleteNote(Note note) {
    _controller.deleteNote(note.id);
    setState(() {});
  }
}
