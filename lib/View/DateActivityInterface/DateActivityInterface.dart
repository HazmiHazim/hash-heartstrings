import 'package:flutter/material.dart';

class DateActivityInterface extends StatefulWidget {
  const DateActivityInterface({Key? key}) : super(key: key);

  @override
  State<DateActivityInterface> createState() => _DateActivityInterfaceState();
}

class _DateActivityInterfaceState extends State<DateActivityInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Activity To Do'),
        centerTitle: true,
      ),
    );
  }
}
