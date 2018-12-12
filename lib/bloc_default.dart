import 'package:bflutter/bloc.dart';
import 'package:rxdart/rxdart.dart';

class BlocDefault<I> extends Bloc<I, I> {
  BlocDefault() {
    this.business = (Observable<I> event) => event;
  }
}
