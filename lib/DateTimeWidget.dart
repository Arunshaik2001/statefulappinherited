
import 'package:flutter/material.dart';
import 'package:statefulappinherited/ApiProviderWidget.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = ApiProviderWidget.of(context).api;
    return Text(api.dateTime ?? 'Tap on Screen ');
  }
}
