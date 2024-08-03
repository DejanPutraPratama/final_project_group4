import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final Function(String?) onChanged;
  const CustomRadioButton({super.key, required this.onChanged});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 10),
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
          'Male',
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
          'Female',
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
        const Text(
          'Other',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
