/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/7/19 5:38 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

/// Cache data from the Network model
class NetCache<T> {
  final T data;
  final dynamic error;
  bool fromNet = false;

  bool get hasData => data != null;

  bool get hasError => error != null;

  NetCache({bool fromNet, this.data, this.error}) {
    if (fromNet != null) this.fromNet = fromNet;
  }
}
