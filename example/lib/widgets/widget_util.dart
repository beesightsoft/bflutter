/*
 * Developed by Nhan Cao on 1/15/20 2:53 PM.
 * Last modified 1/15/20 2:53 PM.
 * Copyright (c) 2020 Beesight Soft. All rights reserved.
 */

import 'dart:io';

import 'package:flutter/material.dart';

class WidgetUtil {
  static double resizeByWidth(context, double value) {
    double screenWidth = MediaQuery.of(context).size.width;
    double result = value * screenWidth / 375;
    return result ?? value;
  }

  static double topSpacer(context) {
    double spacer = 22;
    if (Platform.isIOS && (MediaQuery.of(context).size.height > 800)) {
      spacer = 44;
    }
    return spacer;
  }
}