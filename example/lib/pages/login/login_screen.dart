/*
 * Developed by Nhan Cao on 10/28/19 11:23 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'package:bflutter/widgets/app_network.dart';
import 'package:bflutter_poc/pages/login/login_bloc.dart';
import 'package:bflutter_poc/widgets/bapp_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final bloc = LoginBloc();
  final FocusNode _focusPasswordSignIn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: BAppBar(),
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            AppNetwork(),
            Container(
              // @nhancv 10/25/2019: Request color to get gesture tab
              color: Colors.transparent,
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: 384.0,
                  margin: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 10,
                        offset: Offset(0, 9),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      buildTextLabel("Please enter username"),
                      buildUserNameField(context),
                      buildTextLabel("Please enter password"),
                      buildPasswordField(context),
                      buildLoginButton(context),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        onTap: () {
          closeKeyboard(context);
        },
      ),
    );
  }

  /// @hieu.nguyen 10/24/2019: build text label.
  Widget buildTextLabel(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.0, 24.0, 0, 0),
      child: Container(
        width: 184.0,
        height: 24.0,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.grey[900],
              fontSize: 16.0,
              fontFamily: 'SF-Pro-Text-Bold'),
        ),
      ),
    );
  }

  /// @hieu.nguyen 10/24/2019: build block user name.
  Widget buildUserNameField(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 16.0, 0),
      child: Container(
        width: 344.0,
        height: 44.0,
        child: TextField(
          onChanged: bloc.usernameInput.push,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide.none,
            ),
            hintText: "username",
            fillColor: Colors.grey[50],
          ),
          onSubmitted: (text) {
            FocusScope.of(context).requestFocus(_focusPasswordSignIn);
          },
        ),
      ),
    );
  }

  /// @hieu.nguyen 10/24/2019: build block password.
  Widget buildPasswordField(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 16.0, 32),
      child: Container(
        width: 344.0,
        height: 44.0,
        child: TextField(
          onChanged: bloc.passwordInput.push,
          focusNode: _focusPasswordSignIn,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide.none),
            hintText: "password",
            fillColor: Colors.grey[50],
          ),
          obscureText: true,
          onSubmitted: (text) {
            closeKeyboard(context);
            bloc.loginTrigger.push(true);
          },
        ),
      ),
    );
  }

  /// @hieu.nguyen 10/24/2019: build login button.
  Widget buildLoginButton(context) {
    return Center(
      child: Container(
        width: 144.0,
        height: 40.0,
        margin: EdgeInsets.only(bottom: 32),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: StreamBuilder(
            stream: bloc.validInput.stream,
            builder: (context, snapshot) {
              return RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                color: Color.fromRGBO(42, 194, 208, 1),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: 'SF-Pro-Text-Bold'),
                ),
                onPressed: (snapshot.hasData && snapshot.data)
                    ? () {
                        closeKeyboard(context);
                        bloc.loginTrigger.push(true);
                      }
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }

  // @nhancv 2019-10-28: Close keyboard
  void closeKeyboard(context) {
    FocusScope.of(context).unfocus();
  }
}
