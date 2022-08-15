import 'package:first_app/pages/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home:  const IndexPage(),
    )
);