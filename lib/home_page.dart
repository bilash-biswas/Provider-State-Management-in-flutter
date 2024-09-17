import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/state_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: const Icon(Icons.menu),
        title: const Text('Simple Calculator'),
        foregroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<StateProvider>().incrementCount();
                  },
                  icon: const Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
          )
        ],
      ),
      body: Center(
        child: Consumer<StateProvider>(
          builder: (ctx, _, __) {
            return Text(
              '${ctx.watch<StateProvider>().getCount()}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<StateProvider>().incrementCount();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<StateProvider>().decrementCount();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
