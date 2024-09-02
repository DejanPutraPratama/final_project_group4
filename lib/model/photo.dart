import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  final Function(File) onFileChanged;

  const UploadPhoto({
    super.key,
    required this.onFileChanged,
  });

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onFileChanged(_imageFile!);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onFileChanged(_imageFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          const Text(
            'Upload Photo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          if (_imageFile != null)
            Container(
              width: double.infinity,
              color: Colors.grey[300],
              child: Image.file(
                _imageFile!,
                fit: BoxFit.cover,
              ),
            ),
          if (_imageFile == null)
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
          GestureDetector(
            onTap: _pickImageFromGallery,
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
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
                    child: Text('Pilih di Galeri'),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _pickImageFromCamera,
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
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
                    child: Text('Ambil Foto melalui Kamera'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
