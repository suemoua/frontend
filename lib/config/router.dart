import 'package:flutter/material.dart';
import 'package:flutter_course/constrant/route_path.dart';
import 'package:flutter_course/ui/user/home_page.dart';
import 'package:flutter_course/ui/user/loin_page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.home:
      return PageRouteBuilder<dynamic>(
        pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
        const HomePage(),
      );
    case RoutePath.login:
      return PageRouteBuilder<dynamic>(
        pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
        const LoginPage(),
      );
    default:
      return PageRouteBuilder<dynamic>(
        pageBuilder: (_, Animation<double> a1, Animation<double> a2) =>
        const LoginPage(),
      );
  }
}