import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// enum Gender { male, female , other}


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
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              title: const Text('Male',
              style: TextStyle(fontSize: 11)),
              leading: Radio<String>(
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
          ),
          Expanded(
            child: ListTile(
              title: const Text('Female',
              style: TextStyle(fontSize: 11)),
              leading: Radio<String>(
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
          ),
          Expanded(
            child: ListTile(
              title: const Text('Other',
              style: TextStyle(fontSize: 11)),
              leading: Radio<String>(
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
          ),
        ],
      );
  }
}
//   Enum gender(Male, Female)


//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ListTile(
//             leading: Radio(
//             value: Text('Male'),
//             groupValue: gender,
//             onChanged: (SingingCharacter? value) {
//               setState(() {
//                 _character = value;
//               });
//             },
//           ),
//         )
//       ],
//     );
//   }
// }