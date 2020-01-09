
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String time = 'loading';

  void setWorldTime() async{
    WorldTime instance =  WorldTime(location: 'New_York', flag:'american.png', url: 'America/New_York');

    await instance.getTime();

    print(instance.time);

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,

    });


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setWorldTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.black,
          size: 50.0,
        ),
      ),

    );
  }
}
