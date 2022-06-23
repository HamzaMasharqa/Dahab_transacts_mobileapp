import 'package:first_app/pages/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addingPage extends StatelessWidget {
  const addingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: Scaffold(
      appBar: AppBar(
        title: const Text('Add Transact'),


      ),
      body: ListView(
          children: <Widget>[


        Form(
            padding: const EdgeInsets.only(top: 10),
            child:Column(

          children: <Widget>[

          TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),

                hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
          TextFormField(
            decoration: InputDecoration(hintText: "ent" ,fillColor: Colors.white,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

          ),
        ],))
      ])

    ));
  }

}