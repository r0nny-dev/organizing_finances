import 'package:flutter/material.dart';
import 'package:organizing_finances/src/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Organizing Finances',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
