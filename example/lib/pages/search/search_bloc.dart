/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/9/19 4:36 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

import 'dart:convert';

import 'package:bflutter/bflutter.dart';
import 'package:bflutter/libs/bcache.dart';
import 'package:bflutter_poc/models/remote/net_cache.dart';
import 'package:bflutter_poc/models/remote/user.dart';
import 'package:bflutter_poc/provider/store/remote/search_api.dart';
import 'package:rxdart/rxdart.dart';

/// Implement logic for Search screen
class SearchBloc {
  final loading = BlocDefault<bool>();
  final searchUser = Bloc<String, NetCache<List<User>>>();

  final searchApi = SearchApi();

  SearchBloc() {
    _initLogic();
  }

  void _initLogic() {
    searchUser.logic = (Observable<String> input) => input
            .distinct()
            .debounceTime(Duration(milliseconds: 500))
            .flatMap((input) {
          // @nhancv 10/7/2019: Show loading
          loading.push(true);
          if (input.isEmpty) return Observable.just(null);

          // @nhancv 10/7/2019: Combine with cache data
          return Observable<NetCache<List<User>>>.merge([
            // Get data from api
            Observable.fromFuture(searchApi.searchUsers(input))
                .asyncMap((data) async {
              print('From net: $data');
              if (data == null) {
                return NetCache(fromNet: true, data: <User>[]);
              }
              if (data.statusCode == 200) {
                final List<User> result = json
                    .decode(data.body)['items']
                    .cast<Map<String, dynamic>>()
                    .map<User>((item) => User.fromJson(item))
                    .toList();
                // @nhancv 10/7/2019: Storage data from network to local
                await BCache().insert(Piece(id: input, body: data.body));

                // @nhancv 10/7/2019: Return latest data from network
                return NetCache(fromNet: true, data: result);
              } else {
                throw (data.body);
              }
            }).handleError((error) {}),
            // Get data from local storage
            Observable.fromFuture(BCache().queryId(input)).map((data) {
              print('From cache: $data');
              if (data == null) {
                return NetCache(data: <User>[]);
              }
              List<User> result = json
                  .decode(data.body)['items']
                  .cast<Map<String, dynamic>>()
                  .map<User>((item) => User.fromJson(item))
                  .toList();
              return NetCache(data: result);
            })
          ]);
        }).handleError((error) {
          // @nhancv 10/7/2019: Hide loading
          loading.push(false);
          throw error;
        }).doOnData((data) {
          // @nhancv 10/7/2019: Hide loading
          loading.push(false);
        });
  }

  /// @nhancv 10/7/2019: Dispose bloc
  void dispose() {
    loading.dispose();
    searchUser.dispose();
  }
}
