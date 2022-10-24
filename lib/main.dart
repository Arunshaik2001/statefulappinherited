import 'package:flutter/material.dart';
import 'package:statefulappinherited/Api.dart';
import 'package:statefulappinherited/ApiProviderWidget.dart';
import 'package:statefulappinherited/DateTimeWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApiProviderWidget(
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
        api: Api(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "My Title";
  ValueKey<String?> _textKey = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(ApiProviderWidget.of(context).api.dateTime ?? ''),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () async{
              final api = ApiProviderWidget.of(context).api;
              String dateAndTime = await api.getDateAndTime();
              setState(() {
                _textKey = ValueKey(dateAndTime);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DateTimeWidget(),
              ],
            ),
          ),
        ));
  }
}
