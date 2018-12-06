library bflutter;

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Bloc<M> {
  //Input
  Sink<M> get _inputBloc => _subject;

  //Output
  var _subject = BehaviorSubject<M>();
  Stream<M> _outputBloc;

  Bloc() {
    _outputBloc = _subject.distinct().asBroadcastStream();
  }

  // Add model to Bloc
  addToBloc(M data) => _inputBloc.add(data);

  // Get model from Bloc
  Stream<M> getFromBloc() => _outputBloc;
}
