import 'package:flutter/material.dart';
import 'package:hash_heartstring/Controller/DateActivityController.dart';
import 'package:hash_heartstring/Model/DateActivityModel.dart';
import 'package:hive/hive.dart';

class DateActivityInterface extends StatefulWidget {
  const DateActivityInterface({Key? key}) : super(key: key);

  @override
  State<DateActivityInterface> createState() => _DateActivityInterfaceState();
}

class _DateActivityInterfaceState extends State<DateActivityInterface> {
  //Initialize Controller
  late DateActivityController controller;

  //Initialize Form
  final TextEditingController DateDescriptionForm = TextEditingController();

  //State when user first open the page
  @override
  void initState() {
    super.initState();
    controller = DateActivityController();
  }

  /*@override
  void dispose() {
    controller.dispose();

    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8B1C3),
      appBar: AppBar(title: Text('Date Activity To Do')),
      body: ValueListenableBuilder(
        valueListenable: controller.listenToDateActivities(),
        builder: (BuildContext context, Box<DateActivityModel> box, _) {
          final dateActivities = controller.getDateActivity().toList();
          return ListView.builder(itemCount: dateActivities.length,
            itemBuilder: (BuildContext context, int index) {
              final dateActivity = dateActivities[index];
              return ListTile(
                title: Text(dateActivity.dateDescription),
                subtitle: Text(dateActivity.createdAt.toString()),
                trailing: Checkbox(
                    value: dateActivity.isComplete, onChanged: (value) async {
                  if (value != null) {
                    await controller.updateDateActivity(
                        dateActivity.id, dateActivity.dateDescription, value);
                  }
                }),
                onTap: () async {
                  final result = await showDialog(
                      context: context,
                      builder: (_) =>
                          AlertDialog(
                            title: Text('New Date Activity'),
                            content: TextField(
                              controller: DateDescriptionForm
                                ..text = dateActivity.dateDescription,
                              decoration: InputDecoration(
                                  hintText: 'Date Activity'),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel')),
                              TextButton(onPressed: () async {
                                await controller.updateDateActivity(
                                    dateActivity.id, DateDescriptionForm.text,
                                    dateActivity.isComplete);
                                Navigator.pop(context, true);
                              }, child: Text('Save'),),
                            ],
                          )
                  );
                  if (result == true) {
                    DateDescriptionForm.clear();
                  }
                },
                onLongPress: () async {
                  await controller.deleteDateActivity(dateActivity.id);
                },
              );
            },);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog(
              context: context,
              builder: (_) =>
                  AlertDialog(
                    title: Text('Create Date Activity'),
                    content: TextField(controller: DateDescriptionForm,
                      decoration: InputDecoration(
                          hintText: 'Enter Date Activity'),),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),),
                      TextButton(onPressed: () async {
                        await controller.createDateActivity(
                            DateDescriptionForm.text);
                        Navigator.pop(context, true);
                      },
                        child: Text('Create'),
                      ),
                    ],
                  )
          );
          if (result == true) {
            DateDescriptionForm.clear();
          }
        },
      ),
    );
  }
}
