import 'dart:convert';
import 'dart:async';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../mysql.dart';

class editingPage extends StatefulWidget {
final Map ss;

editingPage(this.ss);
  @override
  _editingPageState createState() => _editingPageState();
}

class _editingPageState extends State<editingPage> {
  var selectedDoc ;
  var selectedCurType ;
  var selectedDateTime ;

  var selectedProject ;
  final voucontroller = TextEditingController( );
  final traDetcontroller = TextEditingController();
  final curpcontroller = TextEditingController();


  var db = Mysql();
  var arr=[];
  List Docs = [];
  List Curs = [];
  List pros = [];
  late Map  inserted;
  @override
  void initState(){
    super.initState();
   inserted = widget.ss;
    voucontroller.text = inserted["VouNo"];
    traDetcontroller.text = inserted["TraDetails"];
    curpcontroller.text = inserted["CurP"];

  }





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


  submit() async{

    Navigator.pop(context);




    Future.delayed(const Duration(seconds: 2));

    String url = "http://172.16.0.22/flutter_php/update.php?id="+inserted["trano"];




print(url);

/*  var url = Uri.parse("http://172.16.0.22/flutter_php/saveinfo.php?date="+selectedDateTime+"&vou="
        +voucontroller.text+"&tradet="+traDetcontroller.text+"&prject="+selectedProject+"&curty="+selectedCurType+"&docty="+selectedDoc);
 var result = await http.get(url);

 print(result.body);

if(result.statusCode == 200){
  Navigator.of(context).pushNamedAndRemoveUntil( "IndexPage", (route) => false);
}else{
  print("saving fail");
}*/


  var map = new Map<String, dynamic>();
    map['date'] = selectedDateTime;
    map['vou'] = voucontroller.text;
    map['tradet'] = traDetcontroller.text;
    map['curp'] = curpcontroller.text;

    map['project'] = selectedProject;
    map['curty'] = selectedCurType;
    map['docty'] = selectedDoc;




    var res =  await http.post(Uri.parse(Uri.encodeFull(url)),headers: {"Accept":"application/json"},body:map);

    var resbo = json.decode(res.body);
print(res.body);



  }







  final _formKey = GlobalKey<FormState>();

  TextEditingController intialdateval = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Transact'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(

                Icons.refresh,
                color: Colors.black,
              ),
              onPressed: () {
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
                              hintText: 'Enter a vouture number here',
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
                            return const Center(child: CircularProgressIndicator());
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
                          child: const Text('UPDATE'),
                        ),
                      ),






                    ],))
            ])

    ));
  }
}