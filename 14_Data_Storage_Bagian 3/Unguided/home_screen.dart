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
