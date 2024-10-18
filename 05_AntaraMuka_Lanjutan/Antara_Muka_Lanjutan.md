<div align="center">
TUGAS PRAKTIKUM <br>
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

# Guided

## 1. ListView.builder <br>
Source Code:
```
import 'package:flutter/material.dart';

class ListviewBuliderExample extends StatelessWidget {
  const ListviewBuliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Listview Builder',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(
                child: Text('Entry ${entries[index]}'),
              ));
        },
      ),
    );
  }
}


```
Output Code:

![ListView Bulider](https://github.com/user-attachments/assets/e4af4507-418c-43e5-9d3b-50fecaffce6e)

## 2. ListView.separated
Source Code:
```
import 'package:flutter/material.dart';

class ListviewSeparated extends StatelessWidget {
  const ListviewSeparated({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListviewSeparated',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Text('Entry ${entries[index]}'),
            ),
          );
        },
      ),
    );
  }
}
```
Output Code:

![ListViewSeparated](https://github.com/user-attachments/assets/4f5894a1-d8dd-4708-a148-6ba586038fb3)

## 3. Flexible and Expanded
Source Code:
```
import 'package:flutter/material.dart';

class FlexibleExpandedScreen extends StatefulWidget {
  const FlexibleExpandedScreen({super.key, required this.title});
  final String title;

  @override
  State<FlexibleExpandedScreen> createState() => _FlexibleExpandedScreenState();
}

class _FlexibleExpandedScreenState extends State<FlexibleExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text("Flexible and Expanded",
            style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                const Text("Flexible"),
                // Flexible
                Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.red,
                    ),
                    Flexible(
                      child: Container(
                        height: 100,
                        color: Colors.green,
                        child: const Text(
                          "Flexible takes up the remaining space but can shrink if needed.",
                        ),
                      ),
                    ),
                    const Icon(Icons.sentiment_very_satisfied),
                  ],
                ),
                const SizedBox(height: 20),
                // Expanded
                const Text("Expanded"),
                Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 100,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.green,
                        child: const Text(
                          "Expanded forces the widget to take up all the remaining space.",
                        ),
                      ),
                    ),
                    const Icon(Icons.sentiment_very_satisfied),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

```
Output Code:

![Flexible And Expanded](https://github.com/user-attachments/assets/94fcb213-556a-4f5b-9ed4-74c4a9537f13)

## 4. CustomScrollView
Source Code:
```
import 'package:flutter/material.dart';

class CustomScrolViewExample extends StatelessWidget {
  const CustomScrolViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliver"),
        backgroundColor: Colors.amber,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // Sliver App Bar
          const SliverAppBar(
            pinned: true,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver App Bar'),
            ),
          ),
          // Sliver Grid
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 6,
            ),
          ),
          // Sliver Fixed List
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

```
Output Code:

![CustomScrollView](https://github.com/user-attachments/assets/73d8849a-a005-461e-aed1-defd42e24038)

## 5.Main_Dart
Source Code
````
import 'package:flutter/material.dart';
import 'package:listview_bulider/custom_scrol_view.dart';
// import 'package:listview_bulider/flexible_expanded.dart';
// import 'listview_separated.dart';
// import 'listview_bulider.dart';

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
      // home: const FlexibleExpandedScreen(title: 'Flexible & Expanded'),
      home: const CustomScrolViewExample(),
    );
  }
}

````

# UNGIDED
Source Code:
````
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
      title: 'Rekomendasi Wisata Banyumas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 90,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Rekomendasi Wisata Banyumas',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              background: Container(
                color: const Color.fromARGB(255, 46, 41, 41),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
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
                            fontSize: 12,
                            color: Color.fromARGB(255, 254, 252, 252)),
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
                            fontSize: 12,
                            color: Color.fromARGB(255, 254, 252, 252)),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: .0, vertical: 8.0),
                      child: Text(
                        'Objek Wisata Peternakan Sapi Baturaden adalah destinasi menarik yang menawarkan pengalaman langsung untuk mengenal lebih dekat dengan kegiatan peternakan sapi. Terletak di daerah Baturaden, Banyumas, objek wisata ini mengedepankan konsep edukasi dan rekreasi bagi pengunjung, terutama bagi keluarga dan anak-anak.Di peternakan ini, pengunjung dapat melihat berbagai jenis sapi, mulai dari sapi potong hingga sapi perah.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 254, 252, 252)),
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
          ),
        ],
      ),
    );
  }
}

````
Output Code:

![Screenshot 2024-10-18 174521](https://github.com/user-attachments/assets/8091d871-3c0b-4776-9e30-1195271327c4)

Deskripsi
Kode tersebut adalah aplikasi Flutter sederhana yang menampilkan daftar rekomendasi wisata di Banyumas. Aplikasi ini menggunakan pada bagian home menggunakan widget Scaffold dan untuk ntuk membuat daftar tempat wisata, digunakan widget CustomScrollView, SliverAppBar sebagai header dengan judul, dan SliverList untuk menampilkan tiga destinasi wisata: Telaga Sunyi, Curug Jenggala, dan Peternakan Sapi Baturaden, masing-masing dengan gambar, judul, dan deskripsi.dimana Daftar wisata ini ditampilkan dengan efek scroll yang menarik, di mana bagian header tetap terlihat meskipun pengguna menggulir daftar kebawa.




