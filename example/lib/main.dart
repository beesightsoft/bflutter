/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/9/19 4:38 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter_poc/my_app.dart';
import 'package:bflutter_poc/provider/global.dart' as global;

void main() async {
  //init dev Global
  global.Global(environment: global.Env.dev());
  await myMain();
}
