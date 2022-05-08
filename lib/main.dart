import 'package:flutter/material.dart';
import 'package:flutter_course/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

