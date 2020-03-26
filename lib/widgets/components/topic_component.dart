import 'package:ben_demistim/model/topic.dart';
import 'package:ben_demistim/widgets/pages/entryPage.dart';
import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  Topic topic;

  //Icon trailingIconOne;
  //Icon trailingIconTwo;

  TopicWidget({@required this.topic});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        //                    <-- BoxDecoration
        border: Border(bottom: BorderSide()),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Entries(
                        topicID: 5786,
                      )));
        },
        title: Text(
          topic.title,
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.thumb_up),
              color: Colors.green,
              padding: new  EdgeInsets.only(right: 10.0, left: 40.0),
              onPressed: () {},
            ),
            new Text(
              topic.like.toString(),
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
            new IconButton(
              icon: new Icon(Icons.thumb_down),
              color: Colors.red,
              padding: new  EdgeInsets.only(right: 10.0, left:30.0),
              onPressed: () {},
            ),
            new Text(
              topic.unlike.toString(),
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}
