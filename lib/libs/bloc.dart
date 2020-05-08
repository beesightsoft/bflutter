import 'package:rxdart/rxdart.dart';

class Bloc<I, O> {
  /// @nhancv 2019-10-04: Input data driven
  final BehaviorSubject<I> _inputSubject = BehaviorSubject<I>();

  /// @nhancv 2019-10-04: Output data driven
  final BehaviorSubject<O> _outputSubject = BehaviorSubject<O>();

  /// @nhancv 2019-10-04: Dynamic logic
  /// Transfer data from input to mapper to output
  set logic(Stream<O> Function(Stream<I> input) mapper) {
    mapper(_inputSubject).listen(_outputSubject.sink.add);
  }

  /// @nhancv 2019-10-04: Push input data to BLoC
  void push(I input) => _inputSubject.sink.add(input);

  /// @nhancv 10/8/2019: Get input stream
  Stream<I> get input => _inputSubject;

  /// @nhancv 2019-10-04: Stream output from BLoC
  Stream<O> get stream => _outputSubject;

  /// @nhancv 2019-10-04: Dispose BLoC
  void dispose() {
    _inputSubject.close();
    _outputSubject.close();
  }

  /// @nhancv 2019-10-04: Build a BLoC instance with logic function as a parameter
  static Bloc build<I, O>(Stream<O> Function(Stream<I> input) mapper) {
    var blocUnit = Bloc<I, O>();
    blocUnit.logic = mapper;
    return blocUnit;
  }
}

/// Default Bloc
class BlocDefault<I> extends Bloc<I, I> {
  BlocDefault() {
    this.logic = (Stream<I> data) => data;
  }
}
