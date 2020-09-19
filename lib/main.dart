import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_testing_talk/api_service.dart';
import 'package:flutter_testing_talk/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => FakeApiService(),
      child: MaterialApp(
        title: '👏Gif👏Review👏',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomePage(),
      ),
    );
  }
}
