import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController extends GetxController {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // Observable list untuk posts
  RxList<dynamic> posts = <dynamic>[].obs;

  // Observable untuk loading state
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
        // Temukan dan update post
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
