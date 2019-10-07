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
