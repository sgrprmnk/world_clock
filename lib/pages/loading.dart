import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String? time='loading';
  // CHANGED to NEWER version; how to fetch data
 Future<void> setupWorldTime() async{
   WorldTime instance=WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
   await instance.getTime();
   // setState(() {
   //   time=instance.time;
   // });
   // Navigation:
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':instance.location,
     'flag':instance.flag,
     'time':instance.time,
     'isDaytime':instance.isDaytime,
   });
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('initState function ran');
   setupWorldTime();
    // print('hey there!');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body:Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 170.0,
        ),
      )
    );
  }
}
