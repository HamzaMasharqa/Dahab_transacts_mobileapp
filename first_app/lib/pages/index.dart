
import 'dart:convert';
import 'package:date_field/date_field.dart';
import 'package:first_app/mysql.dart';
import 'package:first_app/pages/edit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'add.dart';
import 'edit.dart';






class IndexPage extends StatefulWidget {

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

    this.gettrans();
  }

  void gettrans() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
    var url = "http://172.16.0.22/flutter_php/getInfo.php?i=0";
    var result = await http.get(Uri.parse(url));
    response = jsonDecode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(


        title: Text("Hello"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: () {
              Future.delayed(Duration(seconds: 2));
              setState(() {
                this.gettrans();
              });
            },),

        ],


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
      ),

      body: getBody(),


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
    );
  }

  Widget getBody() {
    return ListView.builder(
        itemCount: response.length,
        itemBuilder: (context, index) {
          return CardItem(response[index]);
        });
  }

  Widget CardItem(item) {
    var transacrNO = item['trano'].toString();

    var transacrDet = item['TraDetails'];

    return Card(
      child: Slidable(

        // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: ScrollMotion(),


            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) {
                  deletTransact(transacrNO);
                },
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
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 2,
                onPressed: (context) {
                  editTransact(transacrNO);
                }
                ,
                backgroundColor: Color(0xFF2196f3),
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
            title: Text(transacrDet),)


      ),
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
                    print("Hi");

                    var url = "http://172.16.0.22/flutter_php/delete.php?id=" +
                        id;
                    var result = await http.get(Uri.parse(url));
                    response = json.decode(result.body);


                    Future.delayed(Duration(seconds: 2));
                    print("Hi");


                    this.gettrans();

                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return IndexPage();
                    }));
                    print("Hi");
                  },
                  child: const Text(
                    'Delete',
                  )),
            ],
          );
        });
  }


  editTransact(String id) {
    final _formKey = GlobalKey<FormState>();
    var selectedDoc ;
    var selectedCurType ;
    var selectedDateTime ;

    var selectedProject ;
    final voucontroller = TextEditingController();
    final traDetcontroller = TextEditingController();
    final curpcontroller = TextEditingController();
    submit() async{


      String url = "http://172.16.0.22/flutter_php/saveinfo.php";







      var map = new Map<String, dynamic>();
      map['date'] = selectedDateTime;
      map['vou'] = voucontroller.text;
      map['tradet'] = traDetcontroller.text;

      map['prject'] = curpcontroller.text;
      map['curty'] = selectedCurType;
      map['docty'] = selectedDoc;




      var res =  await http.post(Uri.parse(Uri.encodeFull(url)),headers: {"Accept":"application/json"},body:map);

      var resbo = json.decode(res.body);




    }

    var db = Mysql();
    var arr=[];
    List Docs= [];
    List Curs= [];
    List pros= [];

    Future<List> getDoc() async {

      var url = "http://172.16.0.22/flutter_php/getInfo.php?i=1";
      var result = await http.get(Uri.parse(url));
      var  resBody=(jsonDecode(result.body)as List) ;
      setState(() {
        Docs = resBody;
      });

      return Docs;


    }
    Future<List> getCurType() async {

      var url = "http://172.16.0.22/flutter_php/getInfo.php?i=2";
      var result = await http.get(Uri.parse(url));
      var resBody=(jsonDecode(result.body)as List) ;

      setState(() {
        Curs = resBody;
      });
      return Curs;


    }

    Future<List> getProject() async {

      var url = "http://172.16.0.22/flutter_php/getInfo.php?i=3";
      var result = await http.get(Uri.parse(url));
      var resBody=(jsonDecode(result.body)as List) ;

      setState(() {
        pros = resBody;
      });
      return pros;


    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete?'),
            content: const Text('Are you sure you want to delete this item?'),

            actions: [




              ListView(
          padding: EdgeInsets.all(8),

          children: <Widget>[


          Form(
          key: _formKey,
          child:Column(

          children: <Widget>[

          Padding(

          padding: const EdgeInsets.all(8),
          child:  DateTimeFormField(
          decoration: const InputDecoration(
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.event_note),
          labelText: 'Transact Date',
          ),
          firstDate: DateTime.now().add(const Duration(days: 10)),
          lastDate: DateTime.now().add(const Duration(days: 40)),
          initialDate: DateTime.now().add(const Duration(days: 20)),

          validator: (value) {
          if (value == null ) {


          return 'Please enter date here';
          }
          return null;

          },
          onDateSelected: (DateTime value) {
          selectedDateTime = value.toString();
          },
          ),
          ),
          Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
          keyboardType: TextInputType.number,
          controller: voucontroller,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

          labelText: 'Vou Number',

          contentPadding: const EdgeInsets.all(8)),
          validator: (value) {
          if (value == null || value.isEmpty || value ==0) {


          return 'Please enter vouture number';
          }
          return null;
          },

          ),
          ),



          Padding(
          padding: const EdgeInsets.all(8),
          child:
          FutureBuilder<List>(
          future: getCurType(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          return DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Document Type "),

          items: Docs.map((category) {
          return DropdownMenuItem<String>(

          value: category["doctypeid"],
          child: Text(category["DocType"]),
          );

          }).toList(),
          onChanged: (String? value) {
          setState(() {
          print(value);
          selectedDoc = value!;
          });
          },

          value: selectedDoc,

          );
          }
          return Center(child: CircularProgressIndicator());
          },
          ),


          /*  padding: const EdgeInsets.only(top: 25.0),
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          underline: Container(
                            height: 2,
                            color: Colors.amber,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: items.map((Category){
                            value: Category["DocType"],
                            return DropdownMenuItem(child: Text("DocType")).
                          }).toList();
                        ),*/


          ),
          Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
          controller: traDetcontroller,

          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Transact details',
          contentPadding: const EdgeInsets.all(8)),

          validator: (value) {
          if (value == null || value.isEmpty || value ==0) {
          return 'Please enter the transact details';
          }
          return null;
          },
          ),
          ),
          Padding(
          padding: const EdgeInsets.all(8),
          child:
          FutureBuilder<List>(

          future: getDoc(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          return DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Currency Name"),

          items: Curs.map((category) {
          return DropdownMenuItem<String>(

          value: category["CurrencyNo"],
          child: Text(category["CurrencyName"]),
          );
          }).toList(),
          onChanged: (String? value) {
          setState(() {
          print(value!);

          selectedCurType = value;
          });

          },
          value: selectedCurType,

          );
          }
          return Center(child: CircularProgressIndicator());
          },
          ),


          /*  padding: const EdgeInsets.only(top: 25.0),
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          underline: Container(
                            height: 2,
                            color: Colors.amber,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: items.map((Category){
                            value: Category["DocType"],
                            return DropdownMenuItem(child: Text("DocType")).
                          }).toList();
                        ),*/


          ),
          Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
          keyboardType: TextInputType.number,
          controller: curpcontroller,

          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Currency Price',
          contentPadding: const EdgeInsets.all(8)),
          validator: (value) {
          if (value == null || value.isEmpty || value ==0) {


          return 'Please enter the currency price';
          }
          return null;
          },
          ),
          ),
          Padding(
          padding: const EdgeInsets.all(8),
          child:
          FutureBuilder<List>(
          future: getProject(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          return DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Project Name "),


          items: pros.map((category) {

          return DropdownMenuItem<String>(
          value: category["Projectsno"],
          child: Text(category["projectname"]),
          );
          }).toList(),


          onChanged: (String? value) {
          setState(() {
          print(value!);

          selectedProject = value;
          });

          },
          value: selectedProject,

          );
          }
          return Center(child: CircularProgressIndicator());
          },
          ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
          onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          submit();
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),


          );
          }
          },
          child: const Text('Submit'),
          ),
          ),






          ],))
          ])
        ] );
        });
  }
}

