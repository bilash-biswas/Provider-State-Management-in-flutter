import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/list_map_provider.dart';

class AddDataPage extends StatelessWidget {
  AddDataPage({super.key});
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _cgpa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
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
                    hintText: 'Enter name',
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
              ),const SizedBox(height: 20),
              TextField(
                controller: _cgpa,
                decoration: InputDecoration(
                    label: const Text('Cgpa'),
                    hintText: 'Enter cgpa',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<ListMapProvider>()
                      .addData({'name': _name.text, 'age': _age.text, 'cgpa': _cgpa.text});
                  _name.clear();
                  _age.clear();
                  _cgpa.clear();
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
