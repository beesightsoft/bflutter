/*
 * Developed by Nhan Cao on 10/30/19 2:15 PM.
 * Last modified 10/30/19 2:14 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:flutter/foundation.dart';

class Logging {
  static int tet;

  static void log(dynamic data) {
    if (!kReleaseMode) print(data);
  }
}
