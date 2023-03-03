import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/provider.dart';
import 'package:login_bloc/src/pages/home_page.dart';
import 'package:login_bloc/src/pages/login_page.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Provider(
      key: UniqueKey(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login' :(BuildContext context)=>LoginPage(),
          'home': (BuildContext context)=>HomePage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
  }
}

