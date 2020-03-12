/*
 * Developed by Nhan Cao on 10/28/19 11:22 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:math';

import 'package:bflutter/bflutter.dart';
import 'package:bflutter/provider/app_bloc.dart';
import 'package:bflutter/provider/main_bloc.dart';
import 'package:bflutter/provider/networking.dart';
import 'package:bflutter_poc/models/remote/log_in_request.dart';
import 'package:bflutter_poc/models/remote/log_in_response.dart';
import 'package:bflutter_poc/pages/home/home_screen.dart';
import 'package:bflutter_poc/provider/store/remote/auth_api.dart';
import 'package:bflutter_poc/utils/app_constant.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with AppBloc {
  final usernameInput = Bloc<String, bool>();
  final passwordInput = Bloc<String, bool>();
  final validInput = BlocDefault<bool>();
  final loginTrigger = BlocDefault<bool>();

  final authApi = AuthApi();
  final mainBloc = MainBloc.instance;

  LoginBloc() {
    initLogic();
  }

  @override
  void initLogic() {
    // @nhancv 10/25/2019: Logic check not empty
    usernameInput.logic = (input) => input.map((d) {
          return d.isNotEmpty;
        });
    passwordInput.logic = (input) => input.map((d) => d.isNotEmpty);

    // @nhancv 10/25/2019: Combine logic to check total inputs are valid
    Observable.combineLatest3(usernameInput.stream, passwordInput.stream,
        Networking().networkStatus.stream, (uValid, pValid, network) {
      validInput
          .push(uValid && pValid && (network != ConnectivityStatus.Offline));
    }).listen(null);

    // @nhancv 10/25/2019: Logic trigger sign in
    Observable.combineLatest4(
        usernameInput.input,
        passwordInput.input,
        validInput.stream,
        loginTrigger.stream,
        (username, password, validInput, loginTrigger) =>
            (validInput && loginTrigger)
                ? LogInRequest(username, password)
                : null).asyncMap((form) async {
      if (form == null) return null;

      mainBloc.appLoading.push(true);

      // @nhancv 2019-10-28: Random sign in api
      if (Random().nextBool()) {
        return authApi.signIn().timeout(Duration(seconds: 30));
      } else {
        return authApi.signInWithError().timeout(Duration(seconds: 30));
      }
    }).asyncMap((data) async {
      if (data == null) return false;
      mainBloc.appLoading.push(false);
      try {
        final loginResponse = LoginResponse(data.data);

        // @nhancv 10/25/2019: Success response
        if (loginResponse.accessToken != null &&
            loginResponse.accessToken.isNotEmpty) {
          // @nhancv 10/25/2019: Store key
          await BCache.instance.insert(Piece(
              id: AppConstant.bCacheAuthInfoKey, body: loginResponse.accessToken));
          // @nhancv 2019-10-26: Navigate to seat map screen
          mainBloc.navigateReplace(HomeScreen());
        } else {
          // @nhancv 10/25/2019: Parse error
          if (loginResponse.error) {
            final error = loginResponse.errors.first;
            throw Exception(error != null
                ? 'Code ${error.code ?? -1} - ${error.message ?? 'Empty'}'
                : 'Unknow error.');
          } else {
            throw Exception('Error without reason');
          }
        }
      } catch (e) {
        throw e;
      }
      return null;
    }).handleError((error) {
      mainBloc.appLoading.push(false);
      mainBloc.showAlertDialog(error.toString());
    }).listen(null);

    // @nhancv 10/8/2019: Trigger by button, we need reset latest state
    loginTrigger.logic =
        (Observable<bool> input) => input.map((input) => false);
  }

  @override
  void dispose() {
    usernameInput.dispose();
    passwordInput.dispose();
    loginTrigger.dispose();
  }
}
