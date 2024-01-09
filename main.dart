import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/splashpage.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.black,
            ),
          ),
          tabBarTheme: TabBarTheme(
            indicatorColor: Colors.black,
          ),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20))),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        dropdownMenuTheme:
            DropdownMenuThemeData(textStyle: TextStyle(color: Colors.white)),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
