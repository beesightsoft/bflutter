import 'package:rxdart/rxdart.dart';

class Bloc<I, O> {
  var subject = BehaviorSubject<I>();
  Function(Observable<I> event) business =
      (Observable<I> event) => Observable<O>.empty();

  void push(I event) => subject.add(event);

  Stream<O> stream() => business(subject);

  void dispose() {
    subject.close();
  }

  static Bloc build<I, O>(Function(Observable<I> event) business) {
    var blocUnit = Bloc<I, O>();
    blocUnit.business = business;
    return blocUnit;
  }
}
