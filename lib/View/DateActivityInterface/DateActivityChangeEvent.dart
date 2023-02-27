import 'package:flutter/material.dart';
import 'package:hash_heartstring/Model/DateActivityModel.dart';
import 'package:intl/intl.dart';

class DateActivityChangeEvent extends StatefulWidget {
  const DateActivityChangeEvent({Key? key, required this.dateActivity}) : super(key: key);

  final DateActivityModel dateActivity;

  @override
  State<DateActivityChangeEvent> createState() => _DateActivityChangeEventState();
}

class _DateActivityChangeEventState extends State<DateActivityChangeEvent> {
  //Create Form for User Input
  TextEditingController DateActivityForm = TextEditingController();

  @override
  void initState() {
    super.initState();
    DateActivityForm.text = widget.dateActivity.dateDescription;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), offset: Offset(0, 4), blurRadius: 10)]
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.dateActivity.isComplete = !widget.dateActivity.isComplete;
            widget.dateActivity.save();
          },
          child: Container(
            decoration: BoxDecoration(
              color: widget.dateActivity.isComplete ? Colors.blue : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: .8)
            ),
            child: Icon(Icons.check, color: Colors.white,),
          ),
        ),
        title: widget.dateActivity.isComplete ? Text(DateActivityForm.text, style: TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.lineThrough
        ),) : TextField(
          controller: DateActivityForm,
          decoration: InputDecoration(border: InputBorder.none),
          onSubmitted: (value) {
            if(value.isNotEmpty) {
              widget.dateActivity.dateDescription = value;
              widget.dateActivity.save();
            }
          },
        ),
        trailing: Text(
          DateFormat('hh:mm a').format(widget.dateActivity.createdAt),
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
