// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'package:first_app/mysql.dart';
import 'package:first_app/pages/edit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'add.dart';
import 'edit.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var db = Mysql();
  var arr = [];

  var response = [];

  @override
  void initState() {
    super.initState();

    this.getTrans();
  }

  Future getTrans()  async {
    var url = "http://172.16.0.22/flutter_php/getInfo.php?i=0";
    var result = await http.get(Uri.parse(url));
    response = jsonDecode(result.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  getTrans();
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const addingPage()),
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(
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
        ),
        body: FutureBuilder(
            future: getTrans(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: response.length,
                  itemBuilder: (context, index) {
                    return CardItem(response[index]);
                  });
            }));
  }

  Widget CardItem(item) {
    var transacrNO = item['trano'].toString();

    var transacrDet = item['TraDetails'];

    return InkWell(
      child: Card(
        child: Slidable(

            // The start action pane is the one at the left or the top side.
            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (context) {
                    deletTransact(transacrNO);
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                const SlidableAction(
                  onPressed: null,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),

              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: (context) {
                    editTransact(item);
                  },
                  backgroundColor: const Color(0xFF2196f3),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: ListTile(
              subtitle: Text(transacrNO),
              title: Text(transacrDet),
            )),
      ),
      onTap: () {
        //Here is the alert view dialog
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Transact Number" + "  (" + transacrNO + ")"),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: <Widget>[
                    Text("Transaction Date:  " + item['TraDate']),
                    Text("Transaction Details:  " + transacrDet),
                    Text("Transaction vouture Number:  " + item['VouNo']),
                    Text("Transaction Bill Id:  " + item['BillId']),
                    Text("Transaction Currency Price:  " + item['CurP']),
                    Text("Transaction Project Number:  " + item['Project']),
                    Text("Transaction UserNo:  " + item['UserNo']),
                  ]),
                ),
                insetPadding: const EdgeInsets.all(5),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
    );
  }

  void deletTransact(String id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete?'),
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  child: const Text('No')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const IndexPage(),),);
                    var url =
                        "http://172.16.0.22/flutter_php/delete.php?id=$id";
                    var result = await http.get(Uri.parse(url));
                    response = json.decode(result.body);
                  },
                  child: const Text(
                    'Delete',
                  )),
            ],
          );
        });
  }

  editTransact(Map<String, dynamic> ss) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => editingPage(ss),
      ),
    );
  }
}
