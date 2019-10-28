/*
 * Developed by Nhan Cao on 10/28/19 11:16 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter_poc/provider/networking.dart';
import 'package:flutter/material.dart';

class AppNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Networking().networkStatus.stream,
      builder: (context, snapshot) {
        return snapshot.hasData &&
                (snapshot.data as ConnectivityStatus) ==
                    ConnectivityStatus.Offline
            ? Container(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 41, 92, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'No network',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'SF-Pro-Text-Bold'),
                  ),
                ),
              )
            : SizedBox();
      },
    );
  }
}
