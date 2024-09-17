import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/list_map_provider.dart';
import 'package:provider_state_management/list_page.dart';
import 'package:provider_state_management/state_provider.dart';

import 'home_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ListMapProvider()),
    ChangeNotifierProvider(create: (context) => StateProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
    );
  }
}
