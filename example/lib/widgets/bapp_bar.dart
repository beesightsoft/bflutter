/*
 * Developed by Nhan Cao on 10/28/19 11:24 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:flutter/material.dart';

import '../utils/app_asset.dart';


class BAppBar extends AppBar {
  final String text;

  BAppBar({this.text})
      : super(
    backgroundColor: Color.fromARGB(255, 36, 55, 172),
    title: text != null
        ? Container(
        child: Text(text ?? "Flutter"), width: 123, height: 28)
        : Image.asset(AppImages.icAppIcon, width: 123, height: 28),
  );
}

class TwoLineAppBar extends AppBar {
  final String header;
  final String subTitle;

  TwoLineAppBar(this.header, this.subTitle)
      : super(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: Builder(
      builder: (BuildContext context) {
        return Container(
          width: 40,
          height: 40,
          child: Navigator.canPop(context)
              ? RawMaterialButton(
            padding: EdgeInsets.zero,
            shape: CircleBorder(),
            child: new Container(
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 24,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
              : null,
        );
      },
    ),
    title: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: <Widget>[
            Text(header,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromRGBO(118, 118, 118, 1.0),
                  fontFamily: AppFonts.AvenirNextLTProRegular,
                  fontWeight: FontWeight.w400,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontFamily: AppFonts.AvenirNextLTProRegular,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      Row(
        children: <Widget>[
          SizedBox(
            width: 40,
          )
        ],
      )
    ],
  );
}
