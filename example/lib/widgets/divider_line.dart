/*
 * Developed by Nhan Cao on 1/31/20 2:32 PM.
 * Last modified 1/31/20 11:24 AM.
 * Copyright (c) 2020 Beesight Soft. All rights reserved.
 */
import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  final double width;
  final double height;

  const DividerLine({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 0.5,
      color: Color.fromRGBO(226, 226, 226, 1),
    );
  }
}
