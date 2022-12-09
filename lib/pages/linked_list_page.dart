import 'package:flutter/material.dart';


class LinkedListPage extends StatefulWidget {
  const LinkedListPage({super.key, required this.title});


  final String title;

  @override
  State<LinkedListPage> createState() => _LinkedListPageState();
}

class _LinkedListPageState extends State<LinkedListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
    ),
    );
  }

}