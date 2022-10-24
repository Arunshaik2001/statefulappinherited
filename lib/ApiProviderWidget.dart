import 'package:flutter/material.dart';
import 'package:statefulappinherited/Api.dart';
import 'package:uuid/uuid.dart';

class ApiProviderWidget extends InheritedWidget {
  Api api;
  String uuid;

  ApiProviderWidget({Key? key, required this.api, required Widget child})
      : uuid = const Uuid().v4(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ApiProviderWidget oldWidget) {
    if (uuid == oldWidget.uuid) {
      return false;
    }
    return true;
  }

  static ApiProviderWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiProviderWidget >()!;
  }
}
