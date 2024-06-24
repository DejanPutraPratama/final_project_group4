import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateOfBirthForm extends StatefulWidget {
  final TextEditingController dateController;

  const DateOfBirthForm({Key? key, required this.dateController}) : super(key:key);

  @override
  State<DateOfBirthForm> createState() => _DateOfBirthFormState();
}

class _DateOfBirthFormState extends State<DateOfBirthForm> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(1990), 
      lastDate: DateTime(2101)
    );
    if (picked != null) 
      setState(() {
        widget.dateController.text = picked.toString().split(" ")[0];
      });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Birth Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
        TextField(
          style: const TextStyle(
            color: Colors.black,
          ),
          controller: widget.dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            hintText: 'U can choose ur brith Date',
            hintStyle: TextStyle(
              color: Colors.lightGreen,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.calendar_today,
              size: 24,
              color: Colors.green,
            )
          ),
        ),
      ],
    );
  }
}