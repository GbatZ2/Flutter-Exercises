import 'package:basic_layout_2/custom/button.dart';
import 'package:basic_layout_2/screens/DetailPage.dart';
import 'package:basic_layout_2/utils/customFunctions.dart';
import 'package:basic_layout_2/utils/widget_functions.dart';
import 'package:flutter/material.dart';

import '../custom/BorderBox.dart';
import '../utils/constants.dart';
import '../utils/sample_data.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    final sizePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  addVerticalSpace(padding),
                  Padding(
                    padding: sizePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(
                          width: 50.0,
                          height: 50.0,
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        BorderBox(
                          width: 50.0,
                          height: 50.0,
                          child: Icon(
                            Icons.settings,
                            color: COLOR_BLACK,
                          ),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sizePadding,
                    child: Text('City', style: themeData.textTheme.bodyText2),
                  ),
                  addVerticalSpace(10.0),
                  Padding(
                    padding: sizePadding,
                    child: Text(
                      'San Francisco',
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                      padding: sizePadding,
                      child: Divider(height: padding, color: COLOR_GREY)),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "<\$220,000",
                        "For Sale",
                        "3-4 Beds",
                        ">1000 sqft"
                      ].map((filter) => ChoiceOption(text: filter)).toList(),
                    ),
                  ),
                  addVerticalSpace(10.0),
                  Expanded(
                    child: Padding(
                      padding: sizePadding,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstateItem(itemData: RE_DATA[index]);
                          }),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 20.0,
                  width: size.width,
                  height: 50.0,
                  child: Center(
                    child: OptionButton(
                        icon: Icons.map_rounded,
                        text: 'Map View',
                        width: size.width * 0.4),
                  ))
            ])),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String? text;

  const ChoiceOption({Key? key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text!,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                    itemData: itemData,
                  )));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(itemData['image'])),
                const Positioned(
                    top: 15.0,
                    right: 15.0,
                    child: BorderBox(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.favorite_border,
                        color: COLOR_BLACK,
                      ),
                    ))
              ],
            ),
            addVerticalSpace(15.0),
            Row(children: [
              Text('${formatCurrency(itemData["amount"])}',
                  style: themeData.textTheme.headline1),
              addHorizontalSpace(10.0),
              Text('${itemData["address"]}',
                  style: themeData.textTheme.bodyText2),
              addVerticalSpace(10.0),
            ]),
            Text(
                '${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} area',
                style: themeData.textTheme.headline5),
          ]),
        ));
  }
}
