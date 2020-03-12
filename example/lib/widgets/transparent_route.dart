
import 'package:flutter/material.dart';

///@TanNguyen 2020-02-18: Custom page router to set value opaque => false
///When you push a page, it uses a PageRouteBuilder by default (true),
/// which has an opaque background, you can't user color transparent in your widget

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  ///@TanNguyen 2020-02-18: disable here
  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Color.fromRGBO(54, 54, 54, 0.65);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}

class TransparentSlideRoute extends PageRoute<void> {
  TransparentSlideRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  ///@TanNguyen 2020-02-18: disable here
  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Color.fromRGBO(54, 54, 54, 0.65);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return SlideTransition(
//      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
    position: Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0)).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}