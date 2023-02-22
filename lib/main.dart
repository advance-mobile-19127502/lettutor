import 'package:flutter/material.dart';
import 'package:lettutor/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'WorkSans',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}