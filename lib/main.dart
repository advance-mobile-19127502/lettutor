import 'package:flutter/material.dart';
import 'package:lettutor/data/list_tutor.dart';
import 'package:lettutor/providers/list_tutor_provider.dart';
import 'package:lettutor/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListTutorProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/main-page',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}