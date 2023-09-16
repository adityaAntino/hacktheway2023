import 'package:flutter/material.dart';

class MyBidsScreen extends StatefulWidget {
  final bool isBack;
  const MyBidsScreen({
    Key? key,
    this.isBack = true,
  }) : super(key: key);

  @override
  State<MyBidsScreen> createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
