// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String weekday = DateFormat.EEEE().format(DateTime.now());
  String date = DateFormat.yMMMd().format(DateTime.now());
  String timeNow = DateFormat('hh:mm:ss a').format(DateTime.now());

  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        weekday = DateFormat.EEEE().format(DateTime.now());
        date = DateFormat.yMMMd().format(DateTime.now());
        timeNow = DateFormat('hh:mm:ss a').format(DateTime.now());
      });
    });
  }

  @override
  void initState() {
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
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today's Date is $weekday",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(6.0, 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                date,
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
                timeNow,
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
