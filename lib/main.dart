import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

import './screens/screen_one.dart';
import './screens/screen_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Actions Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String shortcut;

  @override
  void initState() {
    super.initState();

    String icon;

    if (Platform.isAndroid) {
      icon = 'ic_launcher';
    } else if (Platform.isIOS) {
      icon = 'AppIcon';
    }

    QuickActions()
      ..initialize((String shortcutType) {
        setState(() => shortcut = shortcutType);
      })
      ..setShortcutItems(<ShortcutItem>[
        ShortcutItem(
          type: 'action_one',
          localizedTitle: 'Action one',
          icon: icon,
        ),
        ShortcutItem(
          type: 'action_two',
          localizedTitle: 'Action two',
          icon: icon,
        ),
      ]);
  }

  @override
  Widget build(BuildContext context) {
    switch (shortcut) {
      case 'action_one':
        return ScreenOne();
      case 'action_two':
        return ScreenTwo();
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: Center(),
        );
    }
  }
}
