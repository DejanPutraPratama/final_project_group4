import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  File? _imageFile;

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onFileChanged(_imageFile!);
      await _uploadImageToFirebase();
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onFileChanged(_imageFile!);
      await _uploadImageToFirebase();
    }
  }
  
  Future<void> _uploadImageToFirebase() async {
    if (_imageFile == null) return;

    try {
      String fileName = 'photo/${DateTime.now().millisecondsSinceEpoch.toString()}.png';
      Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageReference.putFile(_imageFile!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Save image link to Firestore
      await FirebaseFirestore.instance.collection('users').add({
        'photoUrl': downloadUrl,
        'uploadedAt': Timestamp.now(),
      });

      print('File uploaded and URL saved to Firestore');
      } catch(e) {
        print('Error uploading image: $e ');
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
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
                      child: Text(
                        'Pilih di Galeri'
                      ),
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
                      child: Text(
                        'Ambil Foto melalui Kamera'
                      ),
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