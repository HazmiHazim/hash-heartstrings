import 'package:flutter/material.dart';

class TruthOrDareInterface extends StatefulWidget {
  const TruthOrDareInterface({Key? key}) : super(key: key);

  @override
  State<TruthOrDareInterface> createState() => _TruthOrDareInterfaceState();
}

class _TruthOrDareInterfaceState extends State<TruthOrDareInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text(
            'Truth Or Dare',
            style: TextStyle(color: Colors.white)
        ),
        centerTitle: true,
      ),
    );
  }
}
