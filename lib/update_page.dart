import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_map_provider.dart';

class UpdatePage extends StatelessWidget {
  final String name;
  final String age;
  final String cgpa;
  final int index;

  UpdatePage(
      {super.key,
      required this.name,
      required this.age,
      required this.cgpa,
      required this.index});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _cgpa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _name.text = name;
    _age.text = age.toString();
    _cgpa.text = cgpa.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update/Delete Data'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                    label: const Text('Name'),
                    hintText: name,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _age,
                decoration: InputDecoration(
                    label: const Text('Age'),
                    hintText: 'Enter age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _cgpa,
                decoration: InputDecoration(
                    label: const Text('Cgpa'),
                    hintText: 'Enter cgpa',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ListMapProvider>().updateData({
                        'name': _name.text,
                        'age': _age.text,
                        'cgpa': _cgpa.text
                      }, index);
                      _name.clear();
                      _age.clear();
                      _cgpa.clear();

                      Navigator.pop(context);
                    },
                    child: const Text('Update'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ListMapProvider>().deleteData(index);
                      Navigator.pop(context);
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
