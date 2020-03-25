
import 'package:ben_demistim/model/topic.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  Topic todo;
  AddTodoEvent({this.todo});
}

class DeleteTodoEvent extends TodoEvent {
  int index;
  DeleteTodoEvent({this.index});
}

class ToggleTodoEvent extends TodoEvent {
  int index;
  ToggleTodoEvent({this.index});
}