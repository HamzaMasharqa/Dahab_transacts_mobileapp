import 'package:date_field/date_field.dart';
import 'package:first_app/pages/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mysql.dart';

class addingPage extends StatefulWidget {
  const addingPage({Key? key}) : super(key: key);


  @override
  _addingPageState createState() => _addingPageState();
}

class _addingPageState extends State<addingPage> {

  var db = Mysql();
  var arr=[];
var items=[];

  void initState(){
    super.initState();
    this.getid();
  }
  void getid() async {

    db.getConnection().then((conn) {
      String sql = 'select * from dahabac.doctypes ;';
      conn.query(sql).then((results) {
        for (var raw in results) {
          var x = 0;
          setState(() {
            arr.add(raw.fields);
            x = x + 1;


          });
        }
        for(var i in arr) {

          items.add(arr[i]["DocType"].toString());
          print(items[i].toString());

        }
      });

    });
  }









  String dropdownValue = 'One';
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
                        padding: EdgeInsets.only(top: 25.0),
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
                            print(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Vouture Number',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: DropdownButton<String>(
                          value: dropdownValue,
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
                          items: <String>['One', 'Two', 'asdasdasdaasdasdasd', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'Vouture Number',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: new TextFormField(
                          decoration: new InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              labelText: 'E-Mail',
                              contentPadding: new EdgeInsets.only(bottom: 1.0)),

                          // onSaved: (value) => _email = value,
                        ),
                      ),



                    ],))
            ])

    ));
  }
}
