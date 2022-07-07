import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map  data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data :ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDayTime']?'day.png':'night.png';
    Color bgColor = data['isDayTime']? Colors.blue: Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/${bgImage}'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,100.0,0,0),
              child: Column(
        children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                   dynamic results = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'location': results['location'],
                       'time':results['time'],
                       'flag': results['flag'],
                       'isDayTime': results['isDayTime'],
                     };
                     print(results);
                   });
                   },
                  icon: Icon(
                      Icons.edit_location,
                      color:Colors.grey[300]),
                  label: Text('Edit Location', style: TextStyle(color:Colors.grey[300]))),
                SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],style:(TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.0,
                      color:Colors.white
                    ))
                    )
                  ],
              ),
            SizedBox(height:25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['time'],style:(TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 2.0,
                    color:Colors.white
                ))
                )
              ],
            ),

        ],
      ),
            ),
          )),
    );
  }
}
