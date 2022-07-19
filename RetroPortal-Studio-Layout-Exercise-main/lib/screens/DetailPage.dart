import 'package:flutter/material.dart';
import 'package:basic_layout_2/custom/BorderIcon.dart';
import 'package:basic_layout_2/custom/button.dart';
import 'package:basic_layout_2/utils/constants.dart';
import 'package:basic_layout_2/utils/customfunctions.dart';
import 'package:basic_layout_2/utils/widget_functions.dart';

import '../custom/BorderBox.dart';

class DetailPage extends StatelessWidget {
  final dynamic? itemData;
  const DetailPage({Key? key, @required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    final sidePadding = const EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
        child: Scaffold(
            backgroundColor: COLOR_WHITE,
            body: Container(
                width: size.width,
                height: size.height,
                child: Stack(children: <Widget>[
                  SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headerImage(size, padding, sidePadding, context),
                            addVerticalSpace(padding),
                            titleInfo(
                                padding: padding,
                                itemData: itemData,
                                themeData: themeData),
                            addVerticalSpace(padding),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: padding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('House Information',
                                      style: themeData.textTheme.headline4),
                                  SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(children: <Widget>[
                                      boxInfo(
                                          padding: padding,
                                          themeData: themeData,
                                          itemData: itemData['area'],
                                          itemDataText: "Square Foot",
                                          margin: 0),
                                      boxInfo(
                                          padding: padding,
                                          themeData: themeData,
                                          itemData: itemData['bedrooms'],
                                          itemDataText: 'Bedrooms',
                                          margin: 20.0),
                                      boxInfo(
                                          padding: padding,
                                          themeData: themeData,
                                          itemData: itemData['bathrooms'],
                                          itemDataText: 'Bathrooms',
                                          margin: 20.0),
                                      boxInfo(
                                          padding: padding,
                                          themeData: themeData,
                                          itemData: itemData['garage'],
                                          itemDataText: 'Garage',
                                          margin: 20.0),
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            addVerticalSpace(padding),
                            Padding(
                              padding: sidePadding,
                              child: Container(
                                child: Text('${itemData['description']}'),
                              ),
                            ),
                            addVerticalSpace(padding * 1.5),
                            Positioned(
                                bottom: 20,
                                height: 50.0,
                                width: size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OptionButton(
                                      text: "Message",
                                      icon: Icons.message,
                                      width: size.width * 0.35,
                                    ),
                                    addHorizontalSpace(10),
                                    OptionButton(
                                      text: "Call",
                                      icon: Icons.call,
                                      width: size.width * 0.35,
                                    ),
                                  ],
                                )),
                            addVerticalSpace(padding),
                          ]))
                ]))));
  }

  Stack headerImage(
      Size size, double padding, EdgeInsets sidePadding, BuildContext context) {
    return Stack(
      children: [
        Image.asset(itemData["image"]),
        Positioned(
            width: size.width,
            top: padding,
            child: Padding(
                padding: sidePadding,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const BorderIcon(
                            height: 50.0,
                            width: 50.0,
                            child: Icon(Icons.keyboard_backspace,
                                color: COLOR_BLACK),
                          )),
                      const BorderIcon(
                          height: 50.0,
                          width: 50.0,
                          child:
                              Icon(Icons.favorite_border, color: COLOR_BLACK))
                    ])))
      ],
    );
  }
}

class boxInfo extends StatelessWidget {
  const boxInfo({
    Key? key,
    required this.padding,
    required this.themeData,
    required this.itemData,
    required this.margin,
    required this.itemDataText,
  }) : super(key: key);

  final double padding;
  final ThemeData themeData;
  final dynamic itemData;
  final String itemDataText;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin!),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            addVerticalSpace(padding),
            Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border:
                        Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
                child: Center(
                    child: Text('${itemData}',
                        style: themeData.textTheme.headline2))),
            addVerticalSpace(padding / 2),
            Text('${itemDataText}', style: themeData.textTheme.headline5)
          ]),
    );
  }
}

class titleInfo extends StatelessWidget {
  const titleInfo({
    Key? key,
    required this.padding,
    required this.itemData,
    required this.themeData,
  }) : super(key: key);

  final double padding;
  final dynamic? itemData;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('${formatCurrency(itemData["amount"])}',
              style: TextStyle(
                  fontSize: 35.0,
                  color: COLOR_BLACK,
                  fontWeight: FontWeight.w800)),
          Text('${itemData["address"]}')
        ]),
        Container(
            width: 125.0,
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
            child: Center(
              child: Text(
                '20 Hours ago',
                style: themeData.textTheme.headline5,
              ),
            ))
      ]),
    );
  }
}
