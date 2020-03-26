import 'dart:async';
import 'package:ben_demistim/bloc/bloc.dart';
import 'package:ben_demistim/bloc/topic_event.dart';
import 'package:ben_demistim/model/topic.dart';

class TopicBloc implements Bloc {
  List<Topic> _todos = [];
  
  
  final _todoStateController = StreamController<List<Topic>>();
  StreamSink<List<Topic>> get _inTodoSink => _todoStateController.sink;

  Stream<List<Topic>> get todos => _todoStateController.stream;

  final _todoEventController = StreamController<TodoEvent>();
  Sink<TodoEvent> get todoEventSink => _todoEventController.sink;

  TopicBloc() {


    _todos.add(Topic(1,'Liste İçerik 1',13,5,DateTime.now()));
    _todos.add(Topic(1,'Liste İçerik 2',23,5,DateTime.now()));
    _todos.add(Topic(1,'Liste İçerik 3',376,54,DateTime.now()));
    _todos.add(Topic(1,'Liste İçerik 4',3548,552,DateTime.now()));
    _todos.add(Topic(1,'Liste İçerik 5',387563,5387,DateTime.now()));
    _inTodoSink.add(_todos);
    _todoEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TodoEvent event) {



    if (event is AddTodoEvent) {
      _todos.add(event.todo);
    } else if (event is DeleteTodoEvent) {
      _todos.removeAt(event.index);
    } else if (event is ToggleTodoEvent) {
      _todos.asMap().forEach((index, todo) {
        if (index == event.index) {
          //todo.isCompleted = !todo.isCompleted;
        }
      });
    }

    _inTodoSink.add(_todos);
  }

  void dispatch(TodoEvent event) {
    todoEventSink.add(event);
  }

  void dispose() {
    _todoEventController.close();
    _todoStateController.close();
  }
}