import 'package:collections_navigation_app/pages/linked_list_page.dart';
import 'package:collections_navigation_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Collections App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => const LoginPage(
                title: 'Collections App',
              ),
          '/second': (BuildContext context) =>
              const LinkedListPage(title: 'List')
        });
  }
}
