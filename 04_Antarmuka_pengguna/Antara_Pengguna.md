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
Muhammad Idham Cholid
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

</div>

# Guided

## 1. Pengenalan Widget <br>
   
   Jenis-jenis Layout pada Flutter
<li> Container
    Adalah widget dasar yang digunakan untuk menentukan batasan atau constraints dari child widget-nya. Container dapat diisi dengan berbagai jenis child widget seperti : text, image,         atau bahkan layout widget lainnya.
<li> Row dan Column Adalah layout widget yang digunakan untuk mengatur child widget secara horizontal atau vertical.
<li> Stack Adalah layout widget yang digunakan untuk menumpuk beberapa widget di atau satu sama lain.
<li> Expanded dan Flexible Adalah widget yang digunakan untuk mengatur bagaimana child widget mengisi ruang yang tersedia. Expanded akan memberikan semua ruang yang tersedia ke child 
     widget, sedangkan Flexible akan memberikan sejumlah ruang yang dapat berubahubah sesuai dengan kondisi yang ada.
<li> ListView Adalah widget yang digunakan untuk menampilkan daftar item yang dapat di-scroll.
<li> GridView Adalah widget yang digunakan untuk menampilkan daftar item dalam bentuk grid.
<li> Wrap Adalah widget yang digunakan untuk menampilkan child widget dalam baris atau kolom. Jika child widget melebihi lebar atau tinggi dari wrap, maka widget tersebut akan dibungkus 
     ke baris atau kolom berikutnya.
<li> Table Adalah widget yang digunakan untuk menampilkan data dalam bentuk tabel. TableRow untuk menambahkan baris, dan TableCell untuk menambahkan kolom.

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
![Screenshot 2024-10-13 235715](https://github.com/user-attachments/assets/3ed12c8c-7297-4b06-bc0e-b54a104e0ae2)


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
```
Source Code ```list_view.dart```
```
import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
```

Output Code:<br>
![image](https://github.com/user-attachments/assets/301a7bf9-e497-4d61-b2fd-fe268c4e601d)


## 4. Stack

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
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.green,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
```

Output Code:<br>
![image](https://github.com/user-attachments/assets/a9e7152d-1276-4636-a9cc-955b1e2931af)


### Stack Foreground
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
        child: SizedBox(
          width: 250,
          height: 250,
          child: Stack(
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withAlpha(0),
                      Colors.black12,
                      Colors.black45
                    ],
                  ),
                ),
                child: const Text(
                  'Foreground Text',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
# Unguided

## 1.Modifikasi TP 04

Source Code ```main.dart```
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

Output Code:<br>
![Screenshot 2024-10-13 220905](https://github.com/user-attachments/assets/0047ad95-cd7a-4e6f-a793-528cc499f0c7)







