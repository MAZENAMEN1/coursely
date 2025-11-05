import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static pushTo(BuildContext context, String path, {Object? extra}) {
  return context.push(path, extra: extra);
}
  static pushReplacementNamed(
    BuildContext context,
    String screenPage, [
    Object? extra,
  ]) {
    context.pushReplacement(screenPage);
  }

  static pushNamedTo(
    BuildContext context,
    String screenPage, [
    Object? extra,

    // Future<dynamic> Function(Object?)? onset, .then(onset!)
  ]) {
    context.push(screenPage, extra: extra);
  }

  static pushNamedandRemoveUntilTo(
    BuildContext context,
    String screenPage, [
    Object? extra,
  ]) {
    context.go(screenPage, extra: extra);
  }

  static pop(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }

  static pushReplacementTo(BuildContext context, String path, {Object? extra}) {
    context.pushReplacement(path, extra: extra);
  }
}
