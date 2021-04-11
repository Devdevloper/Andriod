import 'package:flutter/material.dart';
import 'package:wtimeapp/pages/home.dart';
import 'package:wtimeapp/pages/loading.dart';
import 'package:wtimeapp/pages/choose.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Choose(),
    },
  ));
}


