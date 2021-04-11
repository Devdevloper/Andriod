import 'package:flutter/material.dart';
import 'package:wtimeapp/services/world_time.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {

  List<WorldTime> locations = [
    WorldTime(url: "Asia/Kolkata", location: "KOLKATA", flag: "india.png"),
    WorldTime(url: "Europe/London", location: "LONDON", flag: "uk.png"),
    WorldTime(url: "Europe/Berlin", location: "ATHENS", flag: "greece.png"),
    WorldTime(url: "Africa/Cairo", location: "CAIRO", flag: "egypt.png"),
    WorldTime(url: "Africa/Nairobi", location: "NAIROBI", flag: "kenya.png"),
    WorldTime(url: "America/Chicago", location: "CHICAGO", flag: "usa.png"),
    WorldTime(url: "America/New_York", location: "NEW YORK", flag: "usa.png"),
    WorldTime(url: "Asia/Seoul", location: "SEOUL", flag: "south_korea.png"),
  ];

  void updateTime(index) async {
     WorldTime instance = locations[index];
     await instance.getTime();
     //navigate to home screen
    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    print("Hello");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Card(
              color: Colors.white60,
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                    locations[index].location,
                     style: TextStyle(
                       fontSize: 20,
                       letterSpacing: 2,
                       color: Colors.black,
                     ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
