
import 'dart:collection';

import 'package:first_app/mysql.dart';
import 'package:first_app/mysql.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

import 'add.dart';






class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var db = Mysql();
  var arr=[];


  void initState(){
    super.initState();
    this.getid();
  }
  void getid() async{
    db.getConnection().then((conn) {
      String sql = 'select * from dahabac.transacts ;';
      conn.query(sql).then((results) {



        for(var raw in results){
          var x = 0;
          setState(() {
            arr.add(raw.fields);

                x = x+1;

          });


        }


      });

    });
  }

@override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("Hello"),

      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Transact'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 4'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 5'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 6'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ) ,
      body: getBody(),


      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const addingPage()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma mak
    );

  }
  Widget getBody(){

    return ListView.builder(
    itemCount: arr.length,
    itemBuilder: (context, index) {
  return CardItem(arr[index]);
});
  }
  Widget CardItem(item){
var transacrNO = item['trano'].toString();

var transacrDet = item['TraDetails'];

    return Card(
        child: Slidable(
          // Specify a key if the Slidable is dismissible.

          // The start action pane is the one at the left or the top side.
          startActionPane:  ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: ScrollMotion(),


            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: deletTransact(),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,

                label: 'Delete',
              ),
              SlidableAction(
                onPressed: null,
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),

          // The end action pane is the one at the right or the bottom side.
          endActionPane:  ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 2,
                onPressed: editTransact(),
                backgroundColor: Color(0xFF2196f3),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),

            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child:ListTile(
            subtitle: Text(transacrNO),
            title: Text(transacrDet),)


        ),
    );
  }


  deletTransact() {
  print("delete");


  }

  editTransact() {    print("edit");


  }
}


