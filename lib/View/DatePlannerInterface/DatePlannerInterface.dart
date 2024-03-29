import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hash_heartstring/Model/DatePlannerModel/DatePlannerModel.dart';
import 'package:hash_heartstring/main.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class DatePlannerInterface extends StatefulWidget {
  const DatePlannerInterface({Key? key}) : super(key: key);

  @override
  State<DatePlannerInterface> createState() => _DatePlannerInterfaceState();
}

class _DatePlannerInterfaceState extends State<DatePlannerInterface> {
  //Initialize Text Editing Controller
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    final plannerBox = base.dateController.box;
    return ValueListenableBuilder(
      valueListenable: base.dateController.listenToActivity(),
      builder: (BuildContext context, Box<DatePlannerModel> box, Widget? child) {
        var datePlannerBox = box.values.toList();
        datePlannerBox.sort((a, b) => a.createdAt.compareTo(b.createdAt));
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
                                    DatePicker.showTimePicker(context, showSecondsColumn: false, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
                                      if(value.isNotEmpty) {
                                        var datePlannerModel = DatePlannerModel.create(activityName: value, createdAt: date);
                                        base.dateController.createDateActivity(datePlannerModel: datePlannerModel);
                                      }
                                    }, currentTime: DateTime.now());
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
                    base.dateController.deleteDateActivity(datePlannerModel: datePlannerModel);
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
                                base.dateController.updateDateActivity(datePlannerModel: datePlannerModel);
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
                                  base.dateController.updateDateActivity(datePlannerModel: datePlannerModel);
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
