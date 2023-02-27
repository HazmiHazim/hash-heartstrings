import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hash_heartstring/Model/DateActivityModel.dart';
import 'package:hash_heartstring/View/DateActivityInterface/DateActivityChangeEvent.dart';
import 'package:hash_heartstring/main.dart';
import 'package:hive/hive.dart';

class DateActivityInterface extends StatefulWidget {
  const DateActivityInterface({Key? key}) : super(key: key);

  @override
  State<DateActivityInterface> createState() => _DateActivityInterfaceState();
}

class _DateActivityInterfaceState extends State<DateActivityInterface> {
  @override
  Widget build(BuildContext context) {
    final dateActivityBase = BaseWidget.of(context);
    final dateActivityBox = dateActivityBase.DateActivityStore.box;
    return ValueListenableBuilder(
      valueListenable: dateActivityBase.DateActivityStore.listenToDateActivities(),
      builder: (context, Box<DateActivityModel> dateActivityBox, Widget? child) {
        var dateActivities = dateActivityBox.values.toList();
        dateActivities.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 6),
                      child:Text('Whats\'s up for today?', style: TextStyle(color: Colors.black),)
                  )),
              actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: ListTile(
                                title: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter task name'),
                                  onSubmitted: (value) {
                                    Navigator.pop(context);
                                    var currentDate = DateTime.now();
                                    DatePicker.showTimePicker(context,
                                        showSecondsColumn: false,
                                        showTitleActions: true,
                                        onChanged: (date) {
                                        }, onConfirm: (date) {
                                          if(value.isNotEmpty){
                                            var dateActivity = DateActivityModel.create(dateDescription: value, createdAt: date);
                                            dateActivityBase.DateActivityStore.createDateActivity(DateActivityDB: dateActivity);
                                          }

                                        }, currentTime: DateTime.now());
                                  },
                                  autofocus: true,
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            body: ListView.builder(
              itemCount: dateActivities.length,
              itemBuilder: (BuildContext context, int index) {
                var dateActivity = dateActivities[index];
                return Dismissible(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('This task was deleted',
                            style: TextStyle(
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    onDismissed: (direction) {
                      dateActivityBase.DateActivityStore.deleteDateActivity(DateActivityDB: dateActivity);
                    },
                    key: Key(dateActivity.id),
                    child: DateActivityChangeEvent(dateActivity: dateActivity,));
              },
            )
        );
      }
        );
      }
  }

