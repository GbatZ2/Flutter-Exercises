import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Card(),
    ));

class Card extends StatefulWidget {
  const Card({Key? key}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  final List professions = [
    'Pipsas',
    'menu Infantil',
    'caja Baleriaaanaaa',
    'Chacha de Carlao',
    'perro de stuart'
  ];
  int currentProfession = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Id Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (professions.length - 1 > currentProfession) {
              currentProfession += 1;
            } else {
              currentProfession = 0;
            }
          });
        },
        child: Icon(
          Icons.add,
          color: Color.fromARGB(255, 116, 255, 176),
          size: 50.0,
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/musico.png'),
                radius: 40.0,
              ),
            ),

            const SizedBox(height: 20.0),
            const Divider(
                height: 50.0, color: Color.fromARGB(255, 246, 246, 246)),
            //*Name
            const Text(
              'NAME: ',
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Musico',
              style: TextStyle(
                  color: Color.fromARGB(255, 116, 255, 176),
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  letterSpacing: 2.0),
            ),
            const SizedBox(height: 30.0),
            //*Profesion
            const Text(
              'profession: ',
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              '${professions[currentProfession]}',
              style: const TextStyle(
                  color: Color.fromARGB(255, 116, 255, 176),
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  letterSpacing: 2.0),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: const <Widget>[
                Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 169, 169, 169),
                ),
                SizedBox(width: 10.0),
                Text('Musico@musiquilla.com',
                    style: TextStyle(
                      color: Color.fromARGB(255, 169, 169, 169),
                      letterSpacing: 1.5,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
