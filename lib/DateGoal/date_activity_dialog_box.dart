import 'package:flutter/material.dart';
import 'package:hash_heartstring/DateGoal/date_button.dart';
import 'package:hash_heartstring/DateGoal/date_goal_database.dart';
import 'package:hive/hive.dart';

class dateActivityDialogBox extends StatefulWidget {
  const dateActivityDialogBox({super.key});

  @override
  State<dateActivityDialogBox> createState() => _dateActivityDialogBoxState();
}

class _dateActivityDialogBoxState extends State<dateActivityDialogBox> {

  String dateType = 'Dinner';
  final TextEditingController _descriptionDateController = TextEditingController();

  //Reference to DateActivity Box
  var dateActivity = Hive.box('DateActivity');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFF8B1C3),
      content: Container(
        height: 200,
        child: Column(children: [
          //User Select Date Type
          DropdownButtonFormField<String>(
            value: dateType,
            items: const [
              DropdownMenuItem(
                value: 'Dinner',
                child: Text('Dinner Date'),
              ),
              DropdownMenuItem(
                value: 'Movie',
                child: Text('Movie Date'),
              ),
              DropdownMenuItem(
                value: 'Picnic',
                child: Text('Picnic Date'),
              ),
              DropdownMenuItem(
                value: 'Sports',
                child: Text('Sports Date'),
              ),
              DropdownMenuItem(
                value: 'Sightseeing',
                child: Text('Sightseeing Date'),
              ),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Select a Date Type",
            ),
            onChanged: (value) {
              setState(() {
                //_selectedType = value;
              });
            },
          ),
          //Get Description from User
          const SizedBox(height: 16),
           TextField(
            controller: _descriptionDateController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Description",
            ),
          ),

          //Save Button & Cancel Button
          Row(
            children: [
              //Cancel Button
              Expanded(
                  child: DateButton(
                      text: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
              ),

              const SizedBox(width: 16),

              //Save Button
              Expanded(child: DateButton(
                  text: "Save",
                  onPressed: () {
                    dateActivity.put('Description', _descriptionDateController.text);
                    dateActivity.put('DateType', dateType);
                  }
              ),
              ),
            ],
          )
        ],),
      ),
    );
  }
}
