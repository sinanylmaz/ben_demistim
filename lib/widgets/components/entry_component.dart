import 'package:ben_demistim/model/entry.dart';
import 'package:flutter/material.dart';

class EntryWidget extends StatelessWidget {
  Entry entry;

  //Icon trailingIconOne;
  //Icon trailingIconTwo;

  EntryWidget(
      {@required this.entry});

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ListTile(
//                          leading: CircleAvatar(
//                            radius: 25.0,
//                            backgroundImage: NetworkImage(
//                                'https://www.inovex.de/blog/wp-content/uploads/2019/01/Flutter-1-1.png'),
//                          ),
                title: Text(
                  entry.userID.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    entry.comment,
                    style:
                    TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.favorite_border),
                  color: Colors.white,
                  padding: new EdgeInsets.only(right: 10.0, left: 80.0),
                  onPressed: () {},
                ),
                new Text(
                  entry.like.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                new IconButton(
                  icon: new Icon(Icons.thumb_down),
                  color: Colors.white,
                  padding: new EdgeInsets.only(right: 10.0, left: 80.0),
                  onPressed: () {},
                ),
                new Text(
                  entry.unLike.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ],
            ),
            new Divider(
              color: Colors.black45,
            ),
          ],
        ));
  }

//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      decoration: new BoxDecoration(
//          border: new Border.all(color: Colors.grey[500])
//      ),
//      child: new Column(
//        children: <Widget>[
//          new Container (child: new Text(date), color: Colors.yellow[200],),
//          new Container(height: 15.0,),
//          new Text(content),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              new IconButton(icon: trailingIconOne, onPressed: () {}),
//              new Container(width: 10.0,),
//              new IconButton(icon: trailingIconTwo, onPressed: () {})
//            ],
//          )
//        ],
//      ),
//    );
//  }
}