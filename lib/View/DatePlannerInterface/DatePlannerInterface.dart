import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/Model/DatePlannerModel/DatePlannerModel.dart';
import 'package:hash_heartstring/Controller/DatePlannerController/DatePlannerController.dart';
import 'package:intl/intl.dart';

class DatePlannerInterface extends StatefulWidget {
  const DatePlannerInterface({Key? key}) : super(key: key);

  @override
  State<DatePlannerInterface> createState() => _DatePlannerInterfaceState();
}

class _DatePlannerInterfaceState extends State<DatePlannerInterface> {
  // Initialize Text Editing Controller
  final TextEditingController _textController = TextEditingController();

  //
  final FirebaseFirestore db = FirebaseFirestore.instance;
  
  // Initialize Date Planner Controller Class
  final DatePlannerController datePlannerController = DatePlannerController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection('dateActivity').orderBy('createdAt').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error occurred while retrieving data.'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<QueryDocumentSnapshot> datePlannerDocs = snapshot.data!.docs;
        final List<DatePlannerModel> datePlannerBox = datePlannerDocs
            .map((doc) => DatePlannerModel.fromSnapshot(doc))
            .toList();

        return Scaffold(
          backgroundColor: const Color(0xFFE6E6FA),
          appBar: AppBar(
            backgroundColor: const Color(0xFF87CEEB),
            title: const Text(
                'Dating Plan',
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
                    title: const Text('Date Activity', textAlign: TextAlign.center),
                    backgroundColor: const Color(0xFFE6E6FA),
                    content: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _textController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Activity To Do'
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    String value =_textController.text;
                                    //Event Occur When Click Button Save
                                    Navigator.pop(context);
                                    var currentDate = DateTime.now();
                                    datePlannerController.createDateActivity(value, currentDate);
                                    _textController.clear();
                                  },
                                  autofocus: true,
                                  style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                                  child: const Text('Save'),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); //Close Dialog Box
                                  },
                                  autofocus: true,
                                  style: ElevatedButton.styleFrom(primary: const Color(0xFFFF69B4)),
                                  child: const Text('Cancel'),
                                ),
                              )
                            ])
                          ],
                        )
                    ),
                  )
              );
            },
            backgroundColor: const Color(0xFFFF69B4),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          body: datePlannerBox.isEmpty ? const Center(
            child: Text(
              'Tiada Data Dijumpai',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey
              ),
            ),
          ) : ListView.builder(
            itemCount: datePlannerBox.length,
            itemBuilder: (BuildContext context, int index) {
              var datePlannerModel = datePlannerBox[index];
              TextEditingController _textController = TextEditingController(text: datePlannerModel.activityName);
              return Dismissible(
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.delete, color: Colors.redAccent),
                      SizedBox(width: 8),
                      Text('Activity is Deleted', style: TextStyle(color: Colors.blueGrey))
                    ],
                  ),
                  onDismissed: (direction) {
                    datePlannerController.deleteDateActivity(datePlannerModel.id);
                  },
                  key: Key(datePlannerModel.id),
                  child: Column(
                    children: [
                      const SizedBox(height: 13), //Add space between container
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8), //add space between side edge
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF87CEEB).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 4),
                                    blurRadius: 10
                                )
                              ]
                          ),
                          child: ListTile(
                            leading: GestureDetector(
                              onTap: (){
                                datePlannerModel.isCompleted = !datePlannerModel.isCompleted;
                                datePlannerController.updateDateActivity(datePlannerModel.id, datePlannerModel.activityName, datePlannerModel.isCompleted);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: datePlannerModel.isCompleted ? Colors.green : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: const Icon(Icons.check, color: Colors.white),
                              ),
                            ),
                            title: datePlannerModel.isCompleted
                                ? Text(
                              datePlannerModel.activityName,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough
                              ),
                            ): TextField(
                              controller: _textController,
                              decoration: const InputDecoration(border: InputBorder.none),
                              onSubmitted: (value) {
                                if(value.isNotEmpty) {
                                  datePlannerModel.activityName = value;
                                  datePlannerController.updateDateActivity(datePlannerModel.id, value, datePlannerModel.isCompleted);
                                }
                              },
                            ),
                            trailing: Text(
                              DateFormat('h:mm a').format(datePlannerModel.createdAt),
                              style: const TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              );
            },
          ),
        );
      },
    );
  }
}
