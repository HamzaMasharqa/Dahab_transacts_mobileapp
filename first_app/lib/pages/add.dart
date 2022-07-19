import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mysql.dart';

class addingPage extends StatefulWidget {
  const addingPage({Key? key}) : super(key: key);


  @override
  _addingPageState createState() => _addingPageState();
}

class _addingPageState extends State<addingPage> {
   var selectedDoc ;
   var selectedCurType ;

  var db = Mysql();
  var arr=[];
  List Docs= [];
   List Curs= [];

   @override
  void initState(){
    super.initState();

  }





  Future<List> getDoc() async {

    db.getdata().then((conn) {
      String sql = 'select * from dahabac.doctypes ;';


    });

    return Docs;


  }
   Future<List> getCurType() async {

     db.getdata().then((conn) {
       String sql = 'select * from dahabac.currencies ;';


     });

     return Curs;


   }

  TextEditingController intialdateval = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Transact'),


        ),
        body: ListView(
            children: <Widget>[


              Form(
                  child:Column(

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child:  DateTimeFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: 'My Super Date Time Field',
                          ),
                          firstDate: DateTime.now().add(const Duration(days: 10)),
                          lastDate: DateTime.now().add(const Duration(days: 40)),
                          initialDate: DateTime.now().add(const Duration(days: 20)),
                          autovalidateMode: AutovalidateMode.always,
                          validator: (DateTime? e) =>
                          (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                          onDateSelected: (DateTime value) {
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Future Number',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child:
                        FutureBuilder<List>(
                          future: getCurType(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DropdownButton(
                                isExpanded: true,

                                value: selectedDoc,
                                items: snapshot.data?.map((category) {
                                  return DropdownMenuItem(
                                    value: category["DocType"],
                                    child: Text(category["DocType"]),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedDoc = value;
                                  });
                                },
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
                    padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Transact details',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child:
                        FutureBuilder<List>(
                          future: getDoc(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DropdownButton(
                                isExpanded: true,

                                value: selectedCurType,
                                items: snapshot.data?.map((category) {
                                  return DropdownMenuItem(
                                    value: category["CurrencyName"],
                                    child: Text(category["CurrencyName"]),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCurType = value;
                                  });
                                },
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
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Currency Price',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Vouture Number',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: const EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),



                    ],))
            ])

    ));
  }
}
