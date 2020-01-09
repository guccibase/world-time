import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location
  String time; // time 
  String flag; // url asset flag icon
  String url;
  bool isDaytime; // get day or night time

  WorldTime({this.location, this.flag, this.url}); // url for api endpoint


  Future<void> getTime() async{


    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      print(data);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime times = DateTime.parse(dateTime);

      times = times.add(Duration(hours: int.parse(offset)));

      isDaytime = times.hour > 10 && times.hour < 18 ? true: false;

      this.time = DateFormat.jm().format(times);

    }catch(e){
      print('caught exception');
      time = 'no valid data provided';
    }

  }




}