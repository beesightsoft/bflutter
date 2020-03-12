/*
 * Developed by Nhan Cao on 1/16/20 1:59 PM.
 * Last modified 1/16/20 1:59 PM.
 * Copyright (c) 2020 Beesight Soft. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenWidget extends StatelessWidget {
  final Widget body;
  final Widget bottomNavigationBar;
  final Function() unFocus;

  const ScreenWidget(
      {Key key, this.body, this.bottomNavigationBar, this.unFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
          bottomNavigationBar: bottomNavigationBar,
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: body),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          if (unFocus != null) {
            unFocus();
          }
        },
      ),
    );
  }
}
