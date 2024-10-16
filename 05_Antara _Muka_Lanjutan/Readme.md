<div align="center">
TUGAS PENDAHULUAN <br>
PEMROGRAMAN PERANGKAT BERGERAK <br>
<br>
MODUL V <br>
ANTARMUKA PENGGUNA LANJUTAN <br>

<img src="https://lac.telkomuniversity.ac.id/wp-content/uploads/2021/01/cropped-1200px-Telkom_University_Logo.svg-270x270.png" width="250px">

<br>

Disusun Oleh: <br>
Muhammad Idham Cholid <br>
2211104016 <br>
SE-06-01 <br>

<br>

Asisten Praktikum : <br>
Muhammad Faza Zulian Gesit Al Barru <br>
Aisyah Hasna Aulia <br>

<br>

Dosen Pengampu : <br>
Yudha Islami Sulistya, S.Kom., M.Cs <br>

<br>

PROGRAM STUDI S1 REKAYASSA PERANGKAT LUNAK <br>
FAKULTAS INFORMATIKA <br> 
TELKOM UNIVERSITY PURWOKERTO <br>
2024

</div>


# Tugas Pendahuluan
Pada tugas pendahuluan ini, dari aplikasi Rekomendasi Wisata yang telah kalian buat 
pada Unguided Modul 4 (Antarmuka Pengguna), ubahlah menjadi file APK dengan 
cara build APK. Kemudian, upload file APK tersebut ke dalam folder 
5_Antarmuka_Pengguna_Lanjutan pada Submodul TP. 

## Panduan Build APK
- Buka terminal pada proyek Flutter yang telah kalian buat.

- Jalankan perintah berikut untuk membangun file APK flutter build apk –release
![Screenshot 2024-10-14 233634](https://github.com/user-attachments/assets/69d0d71a-a7a8-4c45-8d65-b96bb71c5631)

- File APK yang dihasilkan akan berada di direktori
build/app/outputs/flutter-apk/app-release.apk

Output
  
![Screenshot 2024-10-17 004056](https://github.com/user-attachments/assets/6810557d-4a8a-4850-8cb9-de2a35fbf10f)

Source code :
```
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Rekomendasi Wisata',
          style: TextStyle(
              color: const Color.fromARGB(255, 244, 244, 245), fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(
          height: 500,
          color: const Color.fromARGB(255, 7, 7, 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    'Telaga Sunyi',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 251, 251, 251),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Image.network(
                  'https://static.promediateknologi.id/crop/0x538:960x1191/0x0/webp/photo/p2/74/2024/06/30/IMG-20240630-WA0005-1398012367.jpg',
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0),
                child: Text(
                  'Telaga Sunyi adalah sebuah objek wisata alam yang terletak di Baturaden, Kabupaten Banyumas, Jawa Tengah. Dikenal dengan keindahan alamnya yang menawan, telaga ini dikelilingi oleh hutan yang rimbun dan pegunungan yang hijau, menciptakan suasana tenang dan damai.irnya yang jernih dan segar membuat tempat ini menjadi pilihan ideal bagi pengunjung yang ingin bersantai, menikmati keindahan alam dengan pemandangan yang indah.',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 254, 252, 252)),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 500,
          color: const Color.fromARGB(255, 7, 7, 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    'Curug Jenggala',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 251, 251, 251),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Image.network(
                  'https://atourin.obs.ap-southeast-3.myhuaweicloud.com/images/destination/banyumas/curug-jenggala-profile1672684018.jpeg?x-image-process=image/resize,p_100,limit_1/imageslim',
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0),
                child: Text(
                  'Curug Jengala adalah air terjun yang terletak di kawasan Banyumas, Jawa Tengah. Dikenal dengan keindahan alamnya yang masih alami, Curug Jengala menawarkan pemandangan yang menakjubkan dengan aliran air yang jernih dan deras, mengalir dari ketinggian yang cukup signifikan.tempat ini dikelilingi oleh pepohonan hijau yang lebat, menciptakan suasana sejuk dan tenang, cocok untuk pengunjung yang ingin menikmati keindahan alam dan menghabiskan waktu bersantai.',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 254, 252, 252)),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 400,
          color: const Color.fromARGB(255, 7, 7, 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    'Perternakan Sapi Baturaden',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 251, 251, 251),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Image.network(
                  'https://img.antaranews.com/cache/1200x800/2023/11/23/IMG_20231123_150703.jpg.webp',
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: .0, vertical: 8.0),
                child: Text(
                  'Objek Wisata Peternakan Sapi Baturaden adalah destinasi menarik yang menawarkan pengalaman langsung untuk mengenal lebih dekat dengan kegiatan peternakan sapi. Terletak di daerah Baturaden, Banyumas, objek wisata ini mengedepankan konsep edukasi dan rekreasi bagi pengunjung, terutama bagi keluarga dan anak-anak.Di peternakan ini, pengunjung dapat melihat berbagai jenis sapi, mulai dari sapi potong hingga sapi perah.',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 254, 252, 252)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
          width: 20,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Kunjungi Sekarang',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ]),
    );
  }
}

```
<div>Screenshoot Output
  
![Output aplikasi run di handphone](https://github.com/user-attachments/assets/166808ab-fe4d-4be6-9c0f-bb2b40496f5a)

## Deskripsi Program 
Program yang saya buat adalah sebuah aplikasi Flutter yang menampilkan rekomendasi tempat wisata di 
kawasan Baturaden, Banyumas. Aplikasi ini menggunakan widget MaterialApp dan Scaffold untuk 
membuat kerangka aplikasi, dengan tampilan utama berupa daftar tempat wisata yang disusun 
menggunakan ListView. Setiap tempat wisata disajikan dalam sebuah Container yang menampilkan nama, 
gambar, serta deskripsi singkat dari objek wisata tersebut, seperti Telaga Sunyi, Curug Jenggala, dan 
Peternakan Sapi Baturaden
