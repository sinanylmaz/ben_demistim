import 'package:ben_demistim/model/user.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  User user;
  //Icon trailingIconOne;
  //Icon trailingIconTwo;

  DrawerWidget(
      {@required this.user});

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[


          new UserAccountsDrawerHeader(accountName: new  Text(user.userName, style: TextStyle(fontSize: 15.0,  fontWeight: FontWeight.bold , color: Colors.black),),
            accountEmail: new Text(user.email, style: TextStyle(color: Colors.black),),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.black,
              child: new Text(user.name),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
          ),
          new ListTile(
            trailing: new Icon(Icons.home),
            title: new Text ("Home"),
            onTap: (){
              //Navigator.push(context,  new MaterialPageRoute(builder: (context) => new PageHome()));
            },
          ),
          new ListTile(
            title: new Text("Photo"),
            trailing: new Icon(Icons.photo),
            onTap: (){
              //Navigator.push(context, new MaterialPageRoute(builder: (context) => new PagePhoto()));
            },
          ),

          //Section Line
          new Divider(),

          new ListTile(
            title: new Text("About"),
            trailing: new Icon(Icons.info),
          ),
          new ListTile(
            title: new Text("Exit"),
            trailing: new Icon(Icons.exit_to_app),
          ),
          new Divider(),

        ],
      ),
    );
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