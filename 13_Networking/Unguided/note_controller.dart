import 'package:get/get.dart';
import 'note_model.dart';

class NoteController extends GetxController {
  RxList<Note> notes = <Note>[].obs;

  void addNote(String title, String description) {
    if (title.isNotEmpty && description.isNotEmpty) {
      notes.add(Note(title: title, description: description));
    }
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }
}
