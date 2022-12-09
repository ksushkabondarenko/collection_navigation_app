import 'package:flutter/material.dart';
import 'package:collection_app/src/linked_list.dart';


class LinkedListPage extends StatefulWidget {
  LinkedListPage({super.key, required this.title});
  final String title;

  @override
  State<LinkedListPage> createState() => _LinkedListPageState();
}

class _LinkedListPageState extends State<LinkedListPage> {

  final LinkedList list = LinkedList();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic data;

  Future<void> _addNewData() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Введите данные:'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter data",
                labelText: "Data",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста введите данные';
                } else {
                  data = value;
                };
                },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  setState(() {
                    list.addLast(data);
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('${list[index]}', style: TextStyle(fontSize: 26))
            );
          },
      ),
      appBar: AppBar(
        title: Text(widget.title),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewData();
          },
        tooltip: 'AddNewData',
        child: const Icon(Icons.add),
      ),
    );
  }

}
