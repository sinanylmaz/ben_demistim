import 'package:ben_demistim/bloc/entry_bloc.dart';
import 'package:ben_demistim/model/entry.dart';
import 'package:ben_demistim/widgets/components/entry_component.dart';
import 'package:flutter/material.dart';

class Entries extends StatefulWidget {
   int topicID;

   Entries({Key key, this.topicID=20}) : super(key: key);
  @override
  _Entries createState() => _Entries();
}

class _Entries extends State<Entries> {
  final bloc = EntryBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: new Text(widget.topicID.toString()),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: StreamBuilder(
        stream: bloc.entries,
        builder: (BuildContext context, AsyncSnapshot<List<Entry>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, size) {
                return new EntryWidget(
                  entry:snapshot.data[size]
                );
              },
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
