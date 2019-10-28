/*
 * Developed by Nhan Cao on 10/28/19 11:24 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:flutter/material.dart';

class BAppBar extends AppBar {
  final text;

  BAppBar({this.text})
      : super(
          backgroundColor: Color.fromARGB(255, 36, 55, 172),
          title: text != null
              ? Container(
                  child: Text(text ?? "BFlutter POC"), width: 123, height: 28)
              : Image.asset("assets/icons/bss_full_logo_default.png",
                  width: 123, height: 28),
        );
}
