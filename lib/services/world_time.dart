import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_clock/services/world_time.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? time;
  String? flag; //url to an asset flag icon
  String? url;//location URL for api end point
  bool? isDaytime ;

  WorldTime({required this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      var apiUrl = Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url');
      var response = await http.get(
        apiUrl,
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': 'application/json',
        },
      );
      // print(response.body);
      Map data=  jsonDecode(response.body);
// print(data);
//get properties from data
      String datetime=data['dateTime'];
//   String offset=data['utc_offset'].substring(1,3);
      // print(datetime);
//   print(offset);
//   //Create a date-time obj
      DateTime now=DateTime.parse(datetime);
//     now.add(Duration(hours:int.parse(offset) ));
//     print(now);

//     set the time property
      isDaytime= now.hour> 5 && now.hour<19?true:false;

      time=DateFormat.jm().format(now);
    } catch(e){
      print('error : $e');
      // print(e.toString());
      time='could not get time data';
    }

  }
}


