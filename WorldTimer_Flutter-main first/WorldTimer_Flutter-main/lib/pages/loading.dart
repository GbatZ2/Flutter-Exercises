import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
    WorldTime wt = WorldTime(location:'Berlin', flag:'germany.png', url:'Europe/Berlin');
    await wt.getTime();

    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': wt.location,
      'time':wt.time,
      'flag': wt.flag,
      'isDayTime': wt.isDayTime,
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child:SpinKitDualRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}