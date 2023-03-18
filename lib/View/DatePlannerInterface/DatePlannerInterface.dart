import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hash_heartstring/Model/DatePlannerModel/DatePlannerModel.dart';
import 'package:hash_heartstring/main.dart';
import 'package:hive/hive.dart';

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
                              TextButton(
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
                                style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.blueAccent),
                                child: const Text('Save'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); //Close Dialog Box
                                },
                                style: TextButton.styleFrom(primary: Colors.white, backgroundColor: const Color(0xFFFF69B4)),
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
          body: ListView.builder(
            itemCount: datePlannerBox.length,
            itemBuilder: (BuildContext context, int index) {
              var datePlannerModel = datePlannerBox[index];
              return Dismissible(
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.delete, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Activity is Deleted', style: TextStyle(color: Colors.grey))
                  ],
                ),
                onDismissed: (direction) {
                  base.dateController.deleteDateActivity(datePlannerModel: datePlannerModel);
                },
                key: Key(datePlannerModel.id),
                child: Text(datePlannerModel.activityName),
              );
            },
          ),
        );
      },
    );
  }
}
