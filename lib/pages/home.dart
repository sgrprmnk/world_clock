import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
  // data= ModalRoute.of(context)?.settings.arguments as Map??{};
//  data= ModalRoute.of(context)?.settings.arguments as Map;
  data = data.isNotEmpty
      ? data
      : (ModalRoute.of(context)?.settings.arguments as Map?) ?? {};

  // print(data);
    // setBackground
  String bgImg = (data['isDaytime'] ?? false) ? 'day.png' : 'night.png';
  Color? bgColor =data['isDaytime'] ?Colors.blue:Colors.indigo[700];
  return Scaffold(
    backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
            image:DecorationImage(
                image: AssetImage('assets/$bgImg'),
                fit: BoxFit.cover,
            )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children:<Widget> [
                  TextButton.icon(
                      onPressed: () async{
                      dynamic result= await Navigator.pushNamed(context,'/location');
                      if (result == null) return;
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'isDaytime':result['isDaytime'],
                          'flag':result['flag']
                        };
                      });
                      },
                      icon:Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                          size: 50,
                      ),
                      label:Text(
                          'Edit Location',
                          style: TextStyle(
                            color:Colors.grey[300],
                            fontSize: 24,
                          ),

                      ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style:TextStyle(
                      fontSize: 38,
                      letterSpacing: 2,
                      color:Colors.white,
                  )
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color:Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
