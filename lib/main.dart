import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/presentation/main/view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Need to Provide this widget to use riverpod provider anywhere of this widget tree
    return ProviderScope(
      child: CupertinoApp(
        title: 'Flutter Playground',
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: CupertinoColors.systemBlue,
          scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
        ),
        home: ScaffoldMessenger(
          child: Scaffold(
            body: MainView(),
          ),
        ),
      ),
    );
  }
}
