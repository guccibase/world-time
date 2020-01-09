import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {


    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String image = data['isDaytime'] ? 'day.png': 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue[100]: Colors.black;
    Color txtColor = data['isDaytime'] ? Colors.black: Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$image'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column (
              children: <Widget>[
                FlatButton.icon  (
                    onPressed:  () async  {
                      dynamic result = await Navigator.pushNamed(context, '/ChooseLocation');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Choose Location'),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 30,
                        color: txtColor,
                      ),
                    ),SizedBox(height: 20,
                    ),
                  ],
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 70,
                    color: txtColor,
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}
