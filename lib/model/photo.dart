import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class uploadPhoto extends StatefulWidget {
  final Function(File) onFileChanged;
  const uploadPhoto({
    super.key,
    required this.onFileChanged,
  });

  @override 
  State<uploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<uploadPhoto> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if(mounted) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
    if (pickedFile != null) {
      widget.onFileChanged(File(pickedFile.path));
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (mounted) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
    if (pickedFile != null) {
      widget.onFileChanged(File(pickedFile.path));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          const Text(
            'Upload Photo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 205,
            color: Colors.grey[300],
            child: Icon(
              Icons.camera_alt,
              size: 50,
              color: Colors.grey[700],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_imageFile != null)
                  Image.file(
                    File(_imageFile!.path),
                    width: double.infinity,
                    height: 205,
                    fit: BoxFit.cover,
                  )
                else 
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _pickImageFromGallery,
                        child: IntrinsicWidth(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 30,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Pilih di Galeri'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}