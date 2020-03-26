import 'package:ben_demistim/bloc/topic_bloc.dart';
import 'package:ben_demistim/model/topic.dart';
import 'package:ben_demistim/utils/string_const.dart';
import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  @override
  _Topics createState() => _Topics();
}

class _Topics extends State<Topics> {

  final _bloc = TopicBloc();

  @override
  void dispose(){
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
            if (!snapshot.hasData)
              {
                return Center(
                  child: Text('Loading...'),
                );
              }
            else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,item){
                    return new Container(
                      decoration: BoxDecoration( //                    <-- BoxDecoration
                        border: Border(bottom: BorderSide()),
                      ),
                      child: ListTile(
                        onTap: (){Navigator.of(context).pushReplacementNamed(StringConstant.route_entry);},
                        title: Text(
                          snapshot.data[item].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new IconButton(
                              icon: new Icon(Icons.thumb_down),
                              color: Colors.red,
                              padding: new EdgeInsets.only(right: 10.0),
                              onPressed: () {},
                            ),
                            new IconButton(
                              icon: new Icon(Icons.thumb_up),
                              color: Colors.green,
                              padding: new EdgeInsets.all(0.0),
                              onPressed: () {},
                            ),
                          ],
                        ),

                      ),
                    );

                  },
              );
            }

          }

        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
