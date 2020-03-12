/*
 * Developed by Nhan Cao on 1/31/20 11:21 AM.
 * Last modified 1/31/20 11:21 AM.
 * Copyright (c) 2020 Beesight Soft. All rights reserved.
 */
import 'package:flutter/material.dart';

import '../utils/app_asset.dart';

class EmptyIcon extends StatelessWidget {
  final String iconPath;

  const EmptyIcon({Key key, this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(iconPath ?? AppImages.icEmpty),
      onPressed: null,
    );
  }
}
