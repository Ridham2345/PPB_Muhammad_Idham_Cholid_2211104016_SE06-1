import 'dart:io';

String checkNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return ""; // Teks kosong jika tidak memenuhi syarat
  }
}

void main() {
  // Menerima input dari user
  stdout.write("Masukkan nilai: ");
  int nilai = int.parse(stdin.readLineSync()!);

  // Memeriksa hasil dan mencetak output
  String hasil = checkNilai(nilai);
  if (hasil.isNotEmpty) {
    print("$nilai merupakan $hasil");
  } else {
    print("Nilai tidak valid");
  }
}
