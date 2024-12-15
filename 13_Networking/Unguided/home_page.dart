import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ungided/add.dart';
import 'note_controller.dart';

class HomePage extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Saya'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: noteController.notes.length,
            itemBuilder: (context, index) {
              final note = noteController.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    noteController.deleteNote(index);
                  },
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNotePage()),
        child: Icon(Icons.add),
      ),
    );
  }
}
