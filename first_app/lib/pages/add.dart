import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../mysql.dart';

class addingPage extends StatefulWidget {
  const addingPage({Key? key}) : super(key: key);


  @override
  _addingPageState createState() => _addingPageState();
}

class _addingPageState extends State<addingPage> {
   var selectedDoc ;
   var selectedCurType ;
   var selectedProject ;

  var db = Mysql();
  var arr=[];
  List Docs= [];
   List Curs= [];
   List pros= [];

   @override
  void initState(){
    super.initState();

  }





  Future<List> getDoc() async {

    var url = "http://172.16.0.22/flutter_php/gettrans.php?i=1";
    var result = await http.get(Uri.parse(url));
  var  resBody=(jsonDecode(result.body)as List) ;
    setState(() {
    Docs = resBody;
    });

    return Docs;


  }
   Future<List> getCurType() async {

     var url = "http://172.16.0.22/flutter_php/gettrans.php?i=2";
     var result = await http.get(Uri.parse(url));
     var resBody=(jsonDecode(result.body)as List) ;

     setState(() {
       Curs = resBody;
     });
     return Curs;


   }

   Future<List> getProject() async {

     var url = "http://172.16.0.22/flutter_php/gettrans.php?i=3";
     var result = await http.get(Uri.parse(url));
     var resBody=(jsonDecode(result.body)as List) ;

     setState(() {
       pros = resBody;
     });
     return pros;


   }










  TextEditingController intialdateval = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Transact'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(

                Icons.refresh,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => addingPage()), // this mymainpage is your page to refresh
                      (Route<dynamic> route) => false,
                );
                Future.delayed(Duration(seconds: 2));
                print("Hi");

                setState(() {
                  this.getDoc();
                  this.getCurType();
                  this.getProject();
                });

              },),

          ],

        ),
        body: ListView(
            padding: EdgeInsets.all(8),

            children: <Widget>[


              Form(

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
                          autovalidateMode: AutovalidateMode.always,

                          onDateSelected: (DateTime value) {
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Vou Number',
                              contentPadding: const EdgeInsets.all(8)),

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
                                    value: category["DocType"],
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
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Transact details',
                              contentPadding: const EdgeInsets.all(8)),

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

                                    value: category["CurrencyName"],
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

                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Currency Price',
                              contentPadding: const EdgeInsets.all(8)),

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
                                    value: category["projectname"],
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





                      FloatingActionButton(
                        // When the user presses the button, show an alert dialog containing
                        // the text that the user has entered into the text field.
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Hello"),
                              );
                            },
                          );
                        },
                        tooltip: 'Show me the value!',
                        child: const Icon(Icons.text_fields),
                      ),  ],))
            ])

    ));
  }
}
