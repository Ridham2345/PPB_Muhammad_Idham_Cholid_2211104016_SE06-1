# Cover #
<div align="center">
LAPORAN PRAKTIKUM <br>
PEMROGRAMAN PERANGKAT BERGERAK <br>
<br>
MODUL IV <br>
ANTARMUKA PENGGUNA <br>

<img src="https://lac.telkomuniversity.ac.id/wp-content/uploads/2021/01/cropped-1200px-Telkom_University_Logo.svg-270x270.png" width="250px">

<br>

Disusun Oleh: <br>
Muhammad Idham Cholid/2211104016 <br>
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

</div>

# Guided

## 1. Pengenalan Widget <br>
   
   Jenis-jenis Layout pada Flutter
   1) Container
    Adalah widget dasar yang digunakan untuk menentukan batasan atau constraints dari child widget-nya. Container dapat diisi dengan berbagai jenis child widget seperti : text, image, atau bahkan layout widget lainnya.
   2) Row dan Column Adalah layout widget yang digunakan untuk mengatur child widget secara horizontal atau vertical.
   3) Stack Adalah layout widget yang digunakan untuk menumpuk beberapa widget di atau satu sama lain.
   4) Expanded dan Flexible Adalah widget yang digunakan untuk mengatur bagaimana child widget mengisi ruang yang tersedia. Expanded akan memberikan semua ruang yang tersedia ke child widget, sedangkan Flexible akan memberikan sejumlah ruang yang dapat berubahubah sesuai dengan kondisi yang ada.
   5) ListView Adalah widget yang digunakan untuk menampilkan daftar item yang dapat di-scroll.
   6) GridView Adalah widget yang digunakan untuk menampilkan daftar item dalam bentuk grid.
   7) Wrap Adalah widget yang digunakan untuk menampilkan child widget dalam baris atau kolom. Jika child widget melebihi lebar atau tinggi dari wrap, maka widget tersebut akan dibungkus ke baris atau kolom berikutnya.
   8) Table Adalah widget yang digunakan untuk menampilkan data dalam bentuk tabel. TableRow untuk menambahkan baris, dan TableCell untuk menambahkan kolom.
   
## 2. GridView <br>
Source Code ```main.dart```:
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the"),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Heed not the rabble'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Sound of screams but the'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Who scream'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('Revolution is coming...'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: const Text('Revolution, they...'),
            ),
          ],
        ),
      ),
    );
  }
}

```
Output Code:<br>
![Screenshot 2024-10-13 235715](https://github.com/user-attachments/assets/be3d2d20-641c-4150-8930-b53d09c71d72)


## 3. ListView <br>
   
Source Code ```main.dart```:

```
import 'package:flutter/material.dart';
import 'package:praktikum4_2/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListViewApp(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 255, 187, 0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi),
                SizedBox(height: 8),
                Text("WI-FI"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 106, 0, 255),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_drink),
                SizedBox(height: 8),
                Text("Free Drinks"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 255, 0, 183),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.no_photography),
                SizedBox(height: 8),
                Text('No Photography'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 0, 255, 229),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.no_adult_content),
                SizedBox(height: 8),
                Text('No Adults Content'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


Output Code:<br>
![image](https://github.com/user-attachments/assets/9df13cbb-e2c7-4772-8769-17e9f8fe69ac)

