// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({super.key});

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  // Time
  String hour = "";
  String minute = "";
  String second = "";
  // Date
  String year = "";
  String month = "";
  String day = "";
  String dayWeek = "";
  
  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        year = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        switch (month) {
          case "1":
            month = "Jan";
            break;
          case "2":
            month = "Feb";
            break;
          case "3":
            month = "Mar";
            break;
          case "4":
            month = "Apr";
            break;
          case "5":
            month = "May";
            break;
          case "6":
            month = "Jun";
            break;
          case "7":
            month = "Jul";
            break;
          case "8":
            month = "Aug";
            break;
          case "9":
            month = "Sep";
            break;
          case "10":
            month = "Oct";
            break;
          case "11":
            month = "Nov";
            break;
          case "12":
            month = "Dec";
            break;
        }
        day = DateTime.now().day.toString();
        dayWeek = DateTime.now().weekday.toString();
        switch (dayWeek) {
          case "1":
            dayWeek = "Monday";
            break;
          case "2":
            dayWeek = "Tuesday";
            break;
          case "3":
            dayWeek = "Wednesday";
            break;
          case "4":
            dayWeek = "Thursday";
            break;
          case "5":
            dayWeek = "Friday";
            break;
          case "6":
            dayWeek = "Saturday";
            break;
          case "7":
            dayWeek = "Sunday";
            break;
        }
        hour = DateTime.now().hour.toString();
        minute = DateTime.now().minute.toString();
        second = DateTime.now().second.toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            "Time & Date App",
            style: TextStyle(fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today's Date is $dayWeek",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "$month $day, $year",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "${hour.padLeft(2, "0")}:${minute.padLeft(2, "0")}:${second.padLeft(2, "0")}",
                style: TextStyle(
                  fontSize: 42,
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(10.0, 5.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
