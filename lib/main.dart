import 'package:flutter/material.dart';
import 'package:on_board/home_page.dart';


void main() {
  runApp(const PagedViewApp());
}

class PagedViewApp extends StatelessWidget {
  const PagedViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
