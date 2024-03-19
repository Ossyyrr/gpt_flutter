// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:open_ia_gpt_flutter/layout/pages/home_page/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
