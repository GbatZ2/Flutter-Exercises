import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/Meals.dart';
import 'package:meals/screens/CategoryMealsScreen.dart';
import 'package:meals/screens/FiltersScreen.dart';
import 'package:meals/screens/MealDetailScreen.dart';
import 'package:meals/screens/TabsScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree!) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree!) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan!) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: const Color(0xff7A86B6),
            primaryColorDark: const Color(0xff495C83),
            primaryColorLight: const Color(0xffDAEAF1),
            appBarTheme: const AppBarTheme(color: Color(0xff495C83)),
            textTheme: const TextTheme(
                headline1:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                bodyText1: TextStyle(fontWeight: FontWeight.bold))),
        title: "MealsApp",
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(_favoriteMeals),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailsScreen.routeName: (ctx) =>
              MealDetailsScreen(_toggleFavorite, _isMealFavorite),
          FiltersScreen.routeName: (ctx) => FiltersScreen(
                _setFilters,
                _filters,
              )
        });
  }
}
