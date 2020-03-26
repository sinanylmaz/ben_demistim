import 'package:ben_demistim/bloc/topic_bloc.dart';
import 'package:ben_demistim/model/topic.dart';
import 'package:ben_demistim/utils/string_const.dart';
import 'package:ben_demistim/widgets/components/topic_component.dart';
import 'package:ben_demistim/widgets/pages/entryPage.dart';
import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  @override
  _Topics createState() => _Topics();
}

class _Topics extends State<Topics> {
  final _bloc = TopicBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Trends for you"),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: StreamBuilder(
          stream: _bloc.todos,
          builder: (BuildContext context, AsyncSnapshot<List<Topic>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('Loading...'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) {
                  return new TopicWidget(
                   topic: snapshot.data[item],
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
