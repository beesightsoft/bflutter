import 'package:bflutter/bloc.dart';
import 'package:rxdart/rxdart.dart';

/// Default Bloc
class BlocDefault<I> extends Bloc<I, I> {
  BlocDefault() {
    this.logic = (Observable<I> data) => data;
  }
}
