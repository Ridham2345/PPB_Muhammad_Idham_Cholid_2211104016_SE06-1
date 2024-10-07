                                      TUGAS PENDAHULUAN 
                                 PEMROGRAMAN PERANGKAT BERGERAK  
                                           MODUL IV 
                                     ANTARMUKA PENGGUNA 
                                     
![Picture1](https://github.com/user-attachments/assets/aa7012b5-09e9-4669-8a2f-d6d48de1c033)
                                       
                                       Disusun Oleh:
                                   Muhammad Idham Cholid
                                         2211104016
                                          SE-06-01
                                      Asisten Praktikum: 
                             Muhammad Faza Zulian Gesit Al Barru 
                                      Aisyah Hasna Aulia  

                                        Dosen Pengampu: 
                               Yudha Islami Sulistya, S.Kom., M.Cs. 

                               PROGRAM STUDI S1 SOFTWARE ENGINEERING 
                                       FAKULTAS INFORMATIKA 
                                   TELKOM UNIVERSITY PURWOKERTO 
                                               2024 

 
TUGAS PENDAHULUAN 
 
 
A. SOAL NOMOR 1 
Buatlah tampilan aplikasi sederhana dalam flutter yang menampilkan deskripsi rekomendasi tempat wisata dengan mengimplementasikan widget dasar Detail Tugas: 
•	AppBar: Buatlah sebuah AppBar dengan judul "Rekomendasi Wisata". 
•	Text: Di tengah layar, tambahkan widget Text dengan pesan "Nama Tempat Wisata". 
•	Image: Tambahkan gambar dari internet di bawah teks tersebut menggunakan widget Image.network. 
•	Text: Dibawah gambar, tambahkan deskripsi dari tempat wisata 
•	Button: Tambahkan tombol di bawah gambar dengan label "Kunjungi Tempat". 
 
Source code 
 
 import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata',
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 15, 94),
        title: Text(
          "Rekomendasi Wisata",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Telaga Sigebyar Mangunan',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Image.network(
              'https://media.suara.com/pictures/653x366/2019/09/03/53238-instagram-irawan-   daink-alfarizi.jpg',
              width: 700,
              height: 300,
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Telaga Mangunan Petungkriyono adalah objek wisata alam yang terletak di Kecamatan Petungkriyono, Kabupaten Pekalongan, Jawa Tengah. Petungkriyono sendiri dikenal sebagai kawasan pegunungan yang masih sangat asri dan alami, dengan hutan hujan tropis yang terjaga dengan baik. Telaga Mangunan menjadi salah satu destinasi wisata unggulan di kawasan ini, menawarkan pemandangan yang memukau dan suasana yang menenangkan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Kunjungi Sekarang',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Screenshoot Output  

 ![Hasil Output](https://github.com/user-attachments/assets/bf419df0-46d3-4e77-b643-ae4a74acca42)

  
Deskripsi Program 
Aplikasi Flutter ini menampilkan rekomendasi wisata Telaga Mangunan Petungkriyono. Program menggunakan MyApp sebagai widget utama untuk mengatur tema dan halaman utama. Pada halaman utama, ditampilkan judul, gambar, deskripsi objek wisata, dan tombol. Gambar diambil dari internet, dan deskripsi wisata disusun dalam teks yang diratakan di tengah. Saat dijalankan, aplikasi menampilkan informasi wisata dengan tampilan yang rapi. 


