import 'package:flutter/material.dart';

class Available extends StatelessWidget {
  const Available({Key? key}) : super(key: key);
static const routeName = '/available';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Available"),
      ),
    );
  }
}
