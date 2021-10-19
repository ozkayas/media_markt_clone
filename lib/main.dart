import 'package:flutter/material.dart';
import 'package:media_markt_clone/welcome_view.dart';
import 'package:media_markt_clone/theme.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme(),
      home: WelcomeView(title: 'MediaMarkt Clone'),
    );
  }
}
