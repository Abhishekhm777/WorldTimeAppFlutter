import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<wordTime>locations=[wordTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin'),

    wordTime(location:'London',flag:'germany.png',url:'Europe/London'),
    wordTime(location:'Cairo',flag:'Europe.png',url:'Africa/Cairo'),
    wordTime(location:'Nairobi',flag:'Europe.png',url:'Africa/Nairobi'),
    wordTime(location:'America',flag:'germany.png',url:'America/Chicago'),
    wordTime(location:'America',flag:'germany.png',url:'America/New_York'),
    wordTime(location:'Asia',flag:'germany.png',url:'Asia/Seoul'),
  ];

  void updateTime(index) async{
     wordTime instance=locations[index];
     await instance.getTime();
     Navigator.pop(context,{
       'location':instance.location,
       'flag':instance.flag,
       'time':instance.time,
       'isDayTime':instance.isDayTime,
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[8000],
        title: Text('Edit location'),
        centerTitle: true,
      ),
      body:ListView.builder(itemCount: locations.length,
            itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
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
            },),
    );
  }
}
