
import 'package:flutter/material.dart';
import 'package:flutter_course/ui/user/loin_page.dart';
import 'package:flutter_course/config/router.dart' as route;
  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink,
        backgroundColor: Colors.white,
      ),
      home: const LoginPage(),
      onGenerateRoute: route.generateRoute,
    );
  }
}

