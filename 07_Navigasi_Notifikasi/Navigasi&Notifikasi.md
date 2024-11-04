# Cover #
<div align="center">
LAPORAN PRAKTIKUM <br>
PEMROGRAMAN PERANGKAT BERGERAK <br>
<br>
MODUL VII <br>
Navigasi & Notifikasi <br>

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

PROGRAM STUDI S1 REKAYASA PERANGKAT LUNAK <br>
FAKULTAS INFORMATIKA <br> 
TELKOM UNIVERSITY PURWOKERTO <br>

</div>

#Guided

## 1. Model
Pada umumnya, hampir seluruh aplikasi yang dibuat akan bekerja dengan data. Data 
dalam sebuah aplikasi memiliki sangat banyak bentuk, tergantung dari aplikasi yang 
dibuat. Setiap data yang diterima atau dikirimkan akan lebih baik apabila memiliki 
standar yang sama. Hampir mustahil melakukan peneliharaan project yang kompleks 
tanpa model.

Source Code
main.dart:
```
import 'package:flutter/material.dart';
import 'package:pertemuan_7/mypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: Mypage(
        backgroundColor: Colors.blue,
      ),
    );
  }
}

```

Source Code 
product.dart:
```
class Product {
  final int id;
  final String name;
  final double harga;
  final String image;
  final String deskripsi;

  Product({
    required this.id,
    required this.name,
    required this.harga,
    required this.image,
    required this.deskripsi,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      harga: json['harga'].toDouble(),
      image: json['image'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'harga': harga,
      'image': image,
      'deskripsi': deskripsi,
    };
  }
}

```
## 2. Navigation

Source Code 
mypage.dart:
```
import 'package:flutter/material.dart';
import 'package:pertemuan_7/detail.dart';
import 'package:pertemuan_7/product.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key, required MaterialColor backgroundColor});

  final List<Product> products = [
    Product(
      id: 1,
      name: 'Mouse',
      image:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1,',
      harga: 300000.00,
      deskripsi: 'Mouse gaming',
    ),
    Product(
      id: 2,
      name: 'Keyboard mecanical',
      harga: 350000.00,
      image:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot ',
      deskripsi: 'keyboard mecanical',
    ),
    Product(
      id: 3,
      name: 'Headphone gaming',
      harga: 150000.00,
      image:
          'https://th.bing.com/th/id/OIP.aFnZINBbJ4N3zZbYltDD1AHaE8?w=222&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      deskripsi: 'Headphone gaming',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Page',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 250, 239, 239),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga: ${product.harga.toString()}'),
                Text('Deskripsi: ${product.deskripsi}'),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailProduk(),
                  ));
            },
          );
        },
      ),
    );
  }
}

```

Source Code 
detail.dart:
```
iimport 'package:flutter/material.dart';

class DetailProduk extends StatelessWidget {
  const DetailProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Halaman Detail",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 250, 239, 239),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("ini adalah detail product"),
      ),
    );
  }
}

```
Output Code:

a.Halaman detail

![detail](https://github.com/user-attachments/assets/44abd693-e99d-4be1-83a3-ced24d921307)

b.halaman product

![Mypage](https://github.com/user-attachments/assets/d29d0270-01f1-44c8-886e-a410ac6d2943)

# Ungided

1. Buatlah satu project untuk menampilkan beberapa produk dan halaman e-commerce dengan menerapkan class model serta navigasi halaman.
   Source Code Main.dart

   
Source Code main.dart
```
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


```
Source Code product.dart
```
class Product {
  final int id;
  final String nama;
  final double harga;
  final String imageUrl;
  final String deskripsi;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.imageUrl,
    required this.deskripsi,
  });
}

```
Source Code home_page.dart
```
import 'package:flutter/material.dart';
import 'product.dart';
import 'product_detail.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      nama: 'Laptop',
      harga: 15000000.00,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2llUM7F5XwTSHHpCzLcR3MNM3JdjQ6VMTkA&s',
      deskripsi: 'Laptop gaming',
    ),
    Product(
      id: 2,
      nama: 'Smartphone',
      harga: 8000000.00,
      imageUrl:
          'https://static.retailworldvn.com/Products/Images/12220/299344/smartphone-iphone-12-4gb-64gb-black-1.jpg',
      deskripsi: 'smartphone rog gaming ',
    ),
    Product(
      id: 3,
      nama: 'Mouse',
      harga: 3000000.00,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRV-r-VnsxUPgR8xAIjqE1mYascix_ljATkg&s',
      deskripsi: 'Mouse Gaming',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 149, 244, 152),
        title: const Text('Halaman E-commerce'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetail(product: product),
                ),
              );
            },
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                title: Text(product.nama),
                subtitle: Text('Rp ${product.harga.toString()}'),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


```
Source Code product_detail.dart
```
import 'package:flutter/material.dart';
import 'package:flutter7/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              product.imageUrl,
              width: 200,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              product.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Rp ${product.harga.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 46, 58, 68)),
            ),
            const SizedBox(height: 10),
            Text(
              product.deskripsi,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Tambah ke keranjang button pressed');
              },
              child: const Text('Tambah ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}


```
Output Code:<br>

Halaman E-commerce

![Halaman E-commerce](https://github.com/user-attachments/assets/4024699e-1fa4-4f9e-9bd1-bbebe201e416)

Halaman Detail Navigasi

![Halaman Detail Navigasi](https://github.com/user-attachments/assets/e5932649-102a-486d-b635-d14e8c53f473)



   
