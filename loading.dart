import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:wtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
        void setupWorldTime() async {
          try {
            WorldTime wt = WorldTime(
                location: "KOLKATA", flag: "india.png", url: "Asia/Kolkata");
            await wt.getTime();
            Navigator.pushReplacementNamed(context, "/home", arguments: {
              'location': wt.location,
              'flag': wt.flag,
              'time': wt.time,
              'isDaytime': wt.isDaytime,
            });
          }
          catch (e){
            print("Error : $e");
          }
    }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
              "assets/wtime.png",
            height: 220,
            width: 220,
          ),
        SizedBox(height: 15),
        Text(
        "WORLD TIME",
        style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold),
      ),
        SizedBox(height: 25),
        SpinKitWave(
          color: Colors.white,
          size: 45,
          ),
        ],
      ),
    );
          }
}
