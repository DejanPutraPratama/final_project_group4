import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
class GenderSelectionScreen extends StatefulWidget {
  final Function(String?) onChanged;
  GenderSelectionScreen({required this.onChanged});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            const Text(
              'Male',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Flexible(
              child: Radio<String>(
                  value: "Male",
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                      widget.onChanged(value!);
                    });
                  },
              ),
            ),
            const Text(
              'Female',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Flexible(
              child: Radio<String>(
                  value: "Female",
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                      widget.onChanged(value!);
                    });
                  },
              ),
            ),
            const Text(
              'Other',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Flexible(
              child: Radio<String>(
                  value: "other",
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                      widget.onChanged(value!);
                    });
                  },
              ),
            ),
          ],
        ),
      );
  }
}
