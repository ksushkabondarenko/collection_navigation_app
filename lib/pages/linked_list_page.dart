import 'package:flutter/material.dart';
import 'package:collection_app/collection_app.dart';

class LinkedListPage extends StatefulWidget {
  const LinkedListPage({super.key, required this.title});
  final String title;

  @override
  State<LinkedListPage> createState() => _LinkedListPageState();
}

class _LinkedListPageState extends State<LinkedListPage> {
  final LinkedList list = LinkedList();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  dynamic data;

  Future<void> _editData(index) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Редактируйте данные:'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              initialValue: list.elementAt(index),
              decoration: const InputDecoration(
                hintText: "Change data",
                labelText: "Data",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Пожалуйста введите данные';
                } else {
                  data = value;
                }
                return null;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    list.changeAt(index, data);
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

  Future<void> _addNewData() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Введите данные:'),
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
                }
                return null;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
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
          final item = list[index];
          return Dismissible(
            key: Key(list[index]),
            child: Card(
              child: ListTile(
                title: Text('$item', style: const TextStyle(fontSize: 26)),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () => setState(() {
                    _editData(index);
                  }),
                ),
              ),
            ),
            onDismissed: (durection) {
              setState(() {
                list.removeAt(index);
              });
            },
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
