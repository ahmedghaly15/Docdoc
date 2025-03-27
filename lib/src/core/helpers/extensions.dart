import 'package:flutter/material.dart';

extension AppNavigator on BuildContext {
  Future<dynamic> pushNamed({required String routeName, Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed({
    required String newRoute,
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(this, newRoute, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil({
    required String newRoute,
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      newRoute,
      (Route<dynamic> route) => false, // remove all previous routes
      arguments: arguments,
    );
  }

  void pop() => Navigator.pop(this);
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';
}

extension RequestFocusOnFocusNode on BuildContext {
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
}
