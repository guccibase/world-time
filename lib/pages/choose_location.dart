import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> instances = [
    WorldTime(location: 'New_York', flag:'American.png', url: 'America/New_York'),
    WorldTime(location: 'Athens', flag:'American.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Los_Angeles', flag:'American.jpg', url: 'America/Los_Angeles'),
    WorldTime(location: 'Cairo', flag:'American.jpg', url: 'Africa/Cairo'),
    WorldTime(location: 'Seoul', flag:'American.jpg', url: 'Asia/Seoul'),
    WorldTime(location: 'London', flag:'American.jpg', url: 'Europe/London')
  ];


  void setWorldTime(index) async{

    WorldTime instance = instances[index];

    await instance.getTime();

    print(instance.time);

    Navigator.pop(context,  {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,

    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: ListView.builder(
           itemCount: instances.length,
           itemBuilder: (context, index){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                 child: ListTile(
                   onTap: () {
                     setWorldTime(index);
                   },
                   title: Text(instances[index].url),
                   leading: CircleAvatar(
                     backgroundImage: AssetImage('assets/${instances[index].flag}'),
                   ),
                 ),
               ),
             );
           }
      ),

    );
  }
}
