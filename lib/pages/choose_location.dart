import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter=0;
List<WorldTime> locations=[
  WorldTime(url:'Asia/Kolkata' ,location:'Kolkata' ,flag:'india.png' ),
  WorldTime(url:'Europe/London' ,location:'London' ,flag:'uk.png' ),
  WorldTime(url:'America/Chicago' ,location:'Chicago' ,flag:'usa.png' ),
];
void updateTime(index) async{
  WorldTime instance =locations[index];
  await instance.getTime();
  if (!mounted) return;
  //navigate to home screen
  Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime,
  });
}
  @override
  Widget build(BuildContext context) {
    // print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
        itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
        },
      ),
      // body: ElevatedButton(
      //   onPressed:(){
      //   setState(() {
      //     counter+=1;
      //   });
      //   },
      //   child:Text('counter is $counter'),
      // ),
    );
  }
}
