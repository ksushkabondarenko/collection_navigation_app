import 'package:collections/pages/linked_list_page.dart';
import 'package:collections/pages/login_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collections App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => const LoginPage(title: 'Collections App',),
        '/second':(BuildContext context) => LinkedListPage(title: 'List')
      }
  ));
}
