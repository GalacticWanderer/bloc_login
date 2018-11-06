import 'package:flutter/material.dart';
import 'bloc.dart';

//this class enables widgets to have their own individual copy of bloc
//this is part of the scoped bloc instance as opposed to the single instance
class Provider extends InheritedWidget {
  //declaring the bloc object fir Bloc
  final bloc = Bloc();

  //constructor for Provider
  Provider({Key key, Widget child}) : super(key: key, child: child);

  //function that always returns true
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  //look up the widget hierarchy and return the "provider" for that widget
  Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
