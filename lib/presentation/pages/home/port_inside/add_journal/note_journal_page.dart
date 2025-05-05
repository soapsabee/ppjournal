import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppjournal/presentation/widgets/appbar_custom.dart';

class NoteJournalPage extends StatefulWidget {
  @override
  _NoteJournalPageState createState() => _NoteJournalPageState();
}

class _NoteJournalPageState extends State<NoteJournalPage> {
  final TextEditingController _noteController = TextEditingController();
  XFile? _beforeImage;
  XFile? _afterImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isBefore) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isBefore) {
          _beforeImage = pickedFile;
        } else {
          _afterImage = pickedFile;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Note", shouldShowLeading: true, actions: [
          
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              // Implement functionality here
              Navigator.pop(context);
            },
          )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _noteController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Write your note',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Before Image:'),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickImage(true),
              child: _beforeImage == null
                  ? Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(Icons.add_a_photo, size: 50),
                    )
                  : Image.file(
                      File(_beforeImage!.path),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 20),
            Text('After Image:'),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickImage(false),
              child: _afterImage == null
                  ? Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Icon(Icons.add_a_photo, size: 50),
                    )
                  : Image.file(
                      File(_afterImage!.path),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Spacer(),
          
          ],
        ),
      ),
    );
  }
}