import 'package:flutter/material.dart';

class SecondChildPage extends StatelessWidget {
  const SecondChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("I'm second page child"),
      ),
    );
  }
}
