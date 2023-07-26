import 'package:flutter/material.dart';

class Whilist extends StatefulWidget {
  const Whilist({super.key});

  @override
  State<Whilist> createState() => _WhilistState();
}

class _WhilistState extends State<Whilist> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is whilist page'),
      ),
    );
  }
}
