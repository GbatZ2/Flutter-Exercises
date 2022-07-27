import 'package:flutter/material.dart';
import 'package:meals/screens/FiltersScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title,
          style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              fontWeight: FontWeight.bold)),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
        height: 120.0,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).primaryColorLight,
        child: Text(
          "Cooking up!",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Theme.of(context).primaryColor),
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      buildListTile('Meals', Icons.restaurant, () {
        Navigator.of(context).pushReplacementNamed('/');
      }),
      buildListTile('Settings', Icons.settings, () {
        Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
      })
    ]));
  }
}
