import 'package:rxdart/rxdart.dart';

class Bloc<I, O> {

  // @nhancv 2019-10-04: Data driven
  final BehaviorSubject<I> _subject = BehaviorSubject<I>();

  // @nhancv 2019-10-04: Dynamic logic
  Function(Observable<I> input) logic =
      (Observable<I> input) => Observable<O>.empty();

  // @nhancv 2019-10-04: Push input data to BLoC
  void push(I input) => _subject.sink.add(input);

  // @nhancv 2019-10-04: Stream output from BLoC
  Stream<O> stream() => logic(_subject);

  // @nhancv 2019-10-04: Dispose BLoC
  void dispose() {
    _subject.close();
  }

  // @nhancv 2019-10-04: Build a BLoC instance with logic function as a parameter
  static Bloc build<I, O>(Function(Observable<I> input) logic) {
    var blocUnit = Bloc<I, O>();
    blocUnit.logic = logic;
    return blocUnit;
  }
}
