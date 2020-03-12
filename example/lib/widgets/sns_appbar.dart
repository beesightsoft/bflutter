/*
 * Developed by Nhan Cao on 1/16/20 11:59 AM.
 * Last modified 1/16/20 11:59 AM.
 * Copyright (c) 2020 Beesight Soft. All rights reserved.
 */

import 'package:bflutter/libs/pair.dart';
import 'package:flutter/material.dart';

import '../utils/app_asset.dart';
import 'divider_line.dart';
import 'empty_icon.dart';
import 'widget_util.dart';

class BaseAppBar extends StatelessWidget {
  final Widget left;
  final Widget center;
  final Widget right;

  BaseAppBar({Key key, this.left, this.center, this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Container(
        padding: EdgeInsets.only(top: WidgetUtil.resizeByWidth(context, 20)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                left ?? Container(),
                Spacer(),
                center ?? Container(),
                Spacer(),
                right ?? Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DividerLine()
          ],
        ),
      ),
    );
  }
}

class SnSAppBar extends StatelessWidget {
  final Widget left;
  final String center;
  final Widget right;

  const SnSAppBar({Key key, this.left, this.center, this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      left: Navigator.canPop(context)
          ? IconButton(
              icon: Image.asset(AppImages.icBack),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : left ?? EmptyIcon(),
      center: Text(center ?? '',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: AppFonts.AvenirNextLTProBold,
            fontWeight: FontWeight.w700,
          )),
      right: right ?? EmptyIcon(),
    );
  }
}

class SnSIconAppBar extends StatelessWidget {
  final Pair left; // img path, function
  final String center; // title
  final Pair right; // img path, function

  const SnSIconAppBar({Key key, this.left, this.center, this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      left: left != null
          ? IconButton(
              icon: Image.asset(left.left),
              onPressed: left.right,
            )
          : EmptyIcon(),
      center: Text(center ?? '',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: AppFonts.AvenirNextLTProBold,
            fontWeight: FontWeight.w700,
          )),
      right: right != null
          ? IconButton(
              icon: Image.asset(right.left),
              onPressed: right.right,
            )
          : EmptyIcon(),
    );
  }
}

class SnSTitleAppBar extends StatelessWidget {
  final Pair left; // title, function
  final String center; // title
  final Pair right; // title, function

  const SnSTitleAppBar({Key key, this.left, this.center, this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      left: left != null
          ? FlatButton(
              child: Text(
                left.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: AppFonts.AvenirNextLTProBold,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: left.right,
            )
          : EmptyIcon(),
      center: Text(center ?? '',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: AppFonts.AvenirNextLTProBold,
            fontWeight: FontWeight.w700,
          )),
      right: right != null
          ? FlatButton(
              child: Text(
                right.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: AppFonts.AvenirNextLTProBold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: right.right,
            )
          : EmptyIcon(),
    );
  }
}
