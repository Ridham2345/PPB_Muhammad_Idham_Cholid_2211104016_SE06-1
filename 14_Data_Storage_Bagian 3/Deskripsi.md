# Cover #
<div align="center">
LAPORAN PRAKTIKUM <br>
PEMROGRAMAN PERANGKAT BERGERAK <br>
<br>
MODUL XIV <br>
Data Storage API <br>

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

## Unguided
1. Main.dart

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_15/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

```

2. Home Screen.dart
  ````
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_15/controllers/post_controller.dart';

class HomeScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTTP Request',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        children: [
          // Konten data
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(() {
                if (postController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return postController.posts.isEmpty
                    ? const Center(
                        child: Text(
                          "Tekan tombol GET untuk mengambil data",
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    : ListView.builder(
                        itemCount: postController.posts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Card(
                              elevation: 4,
                              child: ListTile(
                                title: Text(
                                  postController.posts[index]['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                subtitle: Text(
                                  postController.posts[index]['body'],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              }),
            ),
          ),

          // Kontainer untuk tombol-tombol
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200], // Warna latar belakang ringan
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity, // Tombol memenuhi lebar layar
                  child: ElevatedButton(
                    onPressed: () => postController.fetchPosts(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('GET'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => postController.createPost(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('POST'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => postController.updatePost(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('UPDATE'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => postController.deletePost(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('DELETE'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
````
3. Post Controller.dart
   
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController extends GetxController {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

 
  RxList<dynamic> posts = <dynamic>[].obs;


  RxBool isLoading = false.obs;

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        posts.value = json.decode(response.body);
        Get.snackbar('Berhasil', 'Data berhasil diambil!',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPost() async {
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse('$baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'userId': 1,
        }),
      );
      if (response.statusCode == 201) {
        posts.add({
          'title': 'Flutter Post',
          'body': 'Ini contoh POST.',
          'id': posts.length + 1,
        });
        Get.snackbar('Berhasil', 'Data berhasil ditambahkan!',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatePost() async {
    try {
      isLoading.value = true;
      final response = await http.put(
        Uri.parse('$baseUrl/posts/1'),
        body: json.encode({
          'title': 'Updated Title',
          'body': 'Updated Body',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
       
        final index = posts.indexWhere((post) => post['id'] == 1);
        if (index != -1) {
          posts[index]['title'] = 'Updated Title';
          posts[index]['body'] = 'Updated Body';
        }
        Get.snackbar('Berhasil', 'Data berhasil diupdate!',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletePost() async {
    try {

      isLoading.value = true;
      final response = await http.delete(
        Uri.parse('$baseUrl/posts/1'),
      );
      if (response.statusCode == 200) {
        posts.removeWhere((post) => post['id'] == 1);
        Get.snackbar('Berhasil', 'Data berhasil dihapus!',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        throw Exception('Failed to delete post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
```
4. Api Service
   
```
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  List<dynamic> posts = [];

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      posts = json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'userId': 1,
      }),
    );
    if (response.statusCode == 201) {
      posts.add({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'id': posts.length + 1,
      });
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/1'),
      body: json.encode({
        'title': 'Updated Title',
        'body': 'Updated Body',
        'userId': 1,
      }),
    );
    if (response.statusCode == 200) {
      final updatedPost = posts.firstWhere((post) => post['id'] == 1);
      updatedPost['title'] = 'Updated Title';
      updatedPost['body'] = 'Updated Body';
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/1'),
    );
    if (response.statusCode == 200) {
      posts.removeWhere((post) => post['id'] == 1);
    } else {
      throw Exception('Failed to delete post');
    }
  }
}
```

## OUTPUT
1. GET
   
   ![GET](https://github.com/user-attachments/assets/ab191770-71ea-49fb-b0a1-82b3559f1ed3)

2. POST
   
   ![POST](https://github.com/user-attachments/assets/c720be00-d04a-4c40-b3e5-3fd919c6e037)

3. UPDATE
   
   ![UPDATE](https://github.com/user-attachments/assets/e15cd5ba-c90d-4fb0-b478-f8360ca047b9)

4. DELETE
   
   ![Delete](https://github.com/user-attachments/assets/4b70710d-74f8-4b15-93c7-f60dcd5dc3e8)

# Deskripsi 
cara penggunaan Flutter untuk melakukan operasi HTTP menggunakan paket GetX dan HTTP. Dalam aplikasi ini, terdapat beberapa fitur utama yang memungkinkan pengguna untuk mengambil, menambahkan, memperbarui, dan menghapus data dari API publik yang disediakan oleh JSONPlaceholder. Struktur aplikasi terdiri dari beberapa file, termasuk main.dart, home_screen.dart, post_controller.dart, dan api_service.dart
HomeScreen menampilkan daftar postingan yang diambil dari API dan menyediakan tombol untuk melakukan operasi CRUD (Create, Read, Update, Delete). PostController bertanggung jawab untuk mengelola status aplikasi dan berinteraksi dengan API, menggunakan metode asinkron untuk menangani permintaan HTTP dan memperbarui tampilan secara reaktif.



