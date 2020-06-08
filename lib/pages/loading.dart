import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading..';

  void setUpWord() async{

    wordTime instance =wordTime(location:'Berlin',flag:'germany..png',url:'Europe/Berlin');
   await instance.getTime();
   Navigator.pushNamed(context, '/home');
  }
  @override
  void initState() {
    super.initState();
      setUpWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Text(time),
      ),
    );
  }
}
