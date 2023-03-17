import 'package:flutter/material.dart';

class DatePlannerInterface extends StatefulWidget {
  const DatePlannerInterface({Key? key}) : super(key: key);

  @override
  State<DatePlannerInterface> createState() => _DatePlannerInterfaceState();
}

class _DatePlannerInterfaceState extends State<DatePlannerInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF87CEEB),
        title: const Text(
            'Plan To Do',
            style: TextStyle(color: Colors.white)
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Event Occur when click
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Date Activity'),
              backgroundColor: Colors.white,
              content: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Activity To Do'
                      ),
                    ),
                    Row(children: [
                      TextButton(
                        onPressed: () {
                          //Event Occur When Click Button Save
                        },
                        child: const Text('Save'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); //Close Dialog Box
                        },
                        child: const Text('Cancel'),
                      ),
                    ])
                  ],
                )
              ),
            )
          );
        },
        backgroundColor: const Color(0xFFFF69B4),
        child: const Icon(Icons.add),
      ),
    );
  }
}
