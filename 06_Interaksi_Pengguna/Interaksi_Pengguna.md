# Cover #
<div align="center">
LAPORAN PRAKTIKUM <br>
PEMROGRAMAN PERANGKAT BERGERAK <br>
<br>
MODUL VI <br>
INTERAKSI PENGGUNA <br>

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

</div>

# Guided
## 1. Packages
Secara singkat, dart package terdapat pada direktori yang didalamnya terdapat file pubspec.yaml. Contoh penggunaan packages adalah membuat request ke server menggunakan protokol http. Custom navigation/route handling menggunakan fluro, dsb. 

## Packages
Package ada di file pubsec.yaml. Contoh penggunaannya sendiri untuk membuat request ke server menggunakan protocol http, ataupun google_fonts yang digunakan untuk memakai fonts yang ada di google fonts.
Langkah-langkah menggunakan package di Dart :
1. Akses website pub.dev melalui browser.
2. Cari package yang ingin digunakan, misalnya google_fonts.
3. Buka folder project dan cari file pubspec.yaml.
   
   ![image](https://github.com/user-attachments/assets/5af39b18-bf6e-4611-bb83-20ecac45cd3f)

4. Tambahkan package di bawah dependencies:
```
dependencies:
  google_fonts: ^2.1.0
  ```

5. Simpan file dengan menekan CTRL + S atau klik tombol Run di pojok kanan atas.
6. Tunggu proses pub get selesai.
7. Import package di file Dart yang ingin digunakan:
```Dart

import 'package:google_fonts/google_fonts.dart';
```
## 2. User Interaction

### 2.1 Stateful dan Stateles
Widget stateless tidak pernah berubah. Ikon, IconButton, dan Teks adalah contoh widget stateless. Sub kelas widget stateless StatelessWidget. Widget stateful bersifat dinamis misalnya, ia dapat mengubah tampilannya sebagai respons terhadap peristiwa yang dipicu oleh interaksi pengguna atau saat menerima data. Kotak centang, Radio, Slider, InkWell, Form, dan TextField adalah contoh widget stateful. Subkelas widget stateful StatefulWidget. 

### 2.2 Form
Form adalah kumpulan widget yang digunakan untuk mengumpulkan input 
dari pengguna. Biasanya, form ini terdiri dari beberapa field seperti 
TextFormField, Checkbox, Radio, dan lain-lain.

Source Code main.dart:
```
import 'package:flutter/material.dart';
import 'package:pertemuan_5/my_package.dart';
// import 'package:googlepon/my_package.dart';
// import 'package:googlepon/my_tabbar.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPackage(),  
    );
  }
}
```
Source Code my_package.dart:
```
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackage extends StatelessWidget {
  const MyPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Belajar Package',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 45, 44, 41),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                  hintText: 'Masukkan Nama',
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  border: InputBorder.none,
                  hintText: 'Masukkan Email',
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

Output Code:<br>

![image](https://github.com/user-attachments/assets/989199af-9d8c-43d9-88c8-9dd76a5c5d3f)

### 2.3 Menu
Source Code main.dart:
```
import 'package:flutter/material.dart';
import 'package:pertemuan_5/my_tabbar.dart';
// import 'package:googlepon/my_bottomnav.dart';
// import 'package:googlepon/my_package.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabbar(),  
    );
  }
}
```
Source Code my_tabbar.dart:
```
import 'package:flutter/material.dart';

class MyTabbar extends StatelessWidget {
  const MyTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My TabBar App',
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Contoh Tab Bar'),
            backgroundColor: const Color.fromARGB(255, 235, 225, 115),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_car),
                      Text('Car'),
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_bus),
                      Text('Bus'),
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_transit),
                      Text('Transit'),
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_boat),
                      Text('Boat'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_bus),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_boat),
            ],
          ),
        ),
      ),
    );
  }
}

```
Output Code:<br>

![image](https://github.com/user-attachments/assets/85230a8e-55d7-426f-9a68-b3d456f43584)

### 2.4 Buttons
Source Code main.dart:

```
import 'package:flutter/material.dart';
import 'package:pertemuan_5/my_bottom.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyBottomNavBar (),  
    );
  }
}

```
Source code 
```
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  String? selectedValue;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            ElevatedButton(
              onPressed: () {
                // Aksi yang akan dilakukan ketika tombol ditekan
                print('Tombol Elevated ditekan!');
              },
              child: Text('Klik Saya'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, backgroundColor: Colors.grey[200], // Warna latar belakang
              ),
              child: Text('Simpan'),
            ),
            DropdownButton<String>(
              value: selectedValue,
              hint: Text('Pilih Opsi'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items: <String>['Opsi 1', 'Opsi 2', 'Opsi 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
```
Output <br>
![image](https://github.com/user-attachments/assets/732b6e4b-0721-479b-b772-57e478001280)

# Unguided
## Source Code:
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
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 101, 50),
        title: const Text("Beranda"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 24,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 16),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String email = _emailController.text;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Informasi'),
                        content: Text('Nama: $name\nEmail: $email'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 242, 101, 50), // Warna tombol
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              'Ini Halaman Wisata',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Center(
            child: Text(
              'Ini Halaman Profile',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.orange,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}

```
Output

![image](https://github.com/user-attachments/assets/cc4226a1-caab-4ec8-980d-3cba6b802393)

# Dekripsi Pogram <br>
Aplikasi Flutter ini memiliki tiga halaman: Home, Wisata, dan Profile, dengan navigasi menggunakan BottomNavigationBar. Halaman Home memiliki form input nama dan email serta tombol "Submit" yang menampilkan dialog berisi data input. Navigasi antar halaman dikelola oleh PageView dan PageController, sementara AppBar dan BottomNavigationBar mempercantik tampilan aplikasi.




