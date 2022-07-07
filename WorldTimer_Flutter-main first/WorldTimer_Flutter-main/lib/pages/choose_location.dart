import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png',url: 'Asia/Jakarta',),
  ];

  void updateTime(index) async{
      WorldTime wt2 = locations[index];
      await wt2.getTime();
      print(wt2.time);
      Navigator.pop(context, {
        'location': wt2.location,
        'flag': wt2.flag,
        'time':wt2.time,
        'isDayTime': wt2.isDayTime,
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 56, 56),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 26, 97, 133),
          title: Text('Choose a location',
              style: TextStyle(fontWeight: FontWeight.w700)),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
          elevation: 0),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.00,horizontal: 4.00),
            child: Card(
              child:ListTile(
                onTap:(){
                  updateTime(index);
                },
                title: Text(locations[index].location.toString()),
                leading: CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/${locations[index].flag}'),),
              ),
            ),
          );
        },
      ),
    );
  }
}
