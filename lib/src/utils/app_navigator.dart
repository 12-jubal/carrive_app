import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._(); // private constructor to prevent instantiation

  static Future<void> push(BuildContext context, Widget page) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  static Future<void> pushReplacement(BuildContext context, Widget page) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  static Future<void> pushAndRemoveUntil(
      BuildContext context, Widget page, RoutePredicate predicate) {
    return Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), predicate);
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<void> pushNamed(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static Future<void> pushReplacementNamed(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<void> pushNamedAndRemoveUntil(
      BuildContext context, String routeName, RoutePredicate predicate,
      {Object? arguments}) {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  static void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.of(context).popUntil(predicate);
  }
}
