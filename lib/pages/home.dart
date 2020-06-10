import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map dat={};
  @override
  Widget build(BuildContext context) {
  dat= dat.isNotEmpty?dat:  ModalRoute.of(context).settings.arguments;

 String dayOrNigt =dat['isDayTime']?'day.jpg':'night.jpg';
  Color  colors =dat['isDayTime']?Colors.blue:Colors.blue[800];
  Color textColor=dat['isDayTime']?Colors.black:Colors.white;


  return Scaffold(
    backgroundColor: colors,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$dayOrNigt'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Center(
              child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed: () async {
                 dynamic results=  await  Navigator.pushNamed(context, '/choose');
                     setState(() {
                       dat = {
                         'time': results['time'],
                         'location': results['location'],
                         'isDayTime': results['isDayTime'],
                       };
                     });
                },
                    icon: Icon(Icons.edit_location,
                    color: colors,
                    size: 40.2,),
                    label: Text('Edit Location',
                    style: TextStyle(
                      color: textColor,
                    ),)),
                SizedBox(height: 15.0,),

                    Text(dat['location'],
                    style: TextStyle(
                      color: textColor,
                      fontSize: 25.0,
                      letterSpacing: 4.0,
                    ),),
                    SizedBox(height:25.0),
                    Text(dat['time'],
                      style: TextStyle(fontSize: 66.0,
                        color: textColor,
                       ),),
                  ],

      ),
            ),
          ),
        ),),
    );
  }
}
