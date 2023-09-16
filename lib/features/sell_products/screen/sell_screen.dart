import 'package:flutter/material.dart';

class SellScreen extends StatefulWidget {
  final bool isBack;
  const SellScreen({
    Key? key,
    this.isBack = true,
  }) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
