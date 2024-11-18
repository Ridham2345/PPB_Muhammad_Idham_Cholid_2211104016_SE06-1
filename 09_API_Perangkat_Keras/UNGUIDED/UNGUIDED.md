# Unguided
1. Main.dart

````
import 'package:flutter/material.dart';
import 'package:flutter_9/image_picker_srceen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Memilih Gambar',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ImagePickerPage(),
    );
  }
}

````
2. Image_picker_Page.dart

  ````
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk mengambil gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Fungsi untuk mengambil gambar dari kamera
  Future<void> _pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Fungsi untuk menghapus gambar
  void _clearImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Memilih Gambar",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 12, 10),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container untuk menampilkan gambar
          Center(
            child: Container(
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey,
                    ),
            ),
          ),
          const SizedBox(height: 20),
          // Tombol untuk memilih sumber gambar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _pickImageFromCamera,
                icon: const Icon(Icons.camera_alt),
                label: const Text("Camera"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: _pickImageFromGallery,
                icon: const Icon(Icons.photo_library),
                label: const Text("Gallery"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Tombol untuk menghapus gambar
          ElevatedButton(
            onPressed: _clearImage,
            child: const Text("Hapus Gambar"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
        ],
      ),
    );
  }
}
  ````
   
3. MyApi_Page

````
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MyApiPageState extends StatefulWidget {
  @override
  _MyApiPageState createState() => _MyApiPageState();
}

class _MyApiPageState extends State<MyApiPageState> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }
  // Inisialisasi kamera
  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        // Jika tidak ada kamera yang tersedia
        throw Exception("No cameras available on this device.");
      }

      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      await _controller.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      // Tangani error inisialisasi kamera
      print("Error initializing camera: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Kamera tidak tersedia")),
      );
    }
  }
  @override
  void dispose() {
    // Pastikan controller dibuang dengan benar
    if (_isCameraInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Api Perangkat Keras",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _isCameraInitialized
          ? CameraPreview(_controller)
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!_isCameraInitialized) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Kamera belum diinisialisasi")),
            );
            return;
          }

          try {
            // Ambil gambar
            final image = await _controller.takePicture();
            // Navigasikan ke halaman pratinjau
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureScreen(imagePath: image.path),
              ),
            );
          } catch (e) {
            print("Error capturing picture: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Gagal mengambil gambar")),
            );
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Display Picture')),
      body: Center(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
````
# Output


1. Halaman Beranda
   
   ![Screenshot 2024-11-18 231714](https://github.com/user-attachments/assets/b4529bc6-038f-4a6b-91db-8be7da7dbf93)

3. Hasil Dari Camera
   
![Screenshot 2024-11-18 225908](https://github.com/user-attachments/assets/dc0cd7a5-a2f3-48d4-83cb-e295cba72bdb)

3. Hasil Dari Galeri
   
![Screenshot 2024-11-18 231518](https://github.com/user-attachments/assets/93d2a4a2-8f1a-48b0-8da9-0d67aca8f6e1)

Penjelasan 

Code ini adalah implementasi aplikasi sederhana Flutter untuk mengakses kamera perangkat menggunakan library camera. Aplikasi akan menampilkan pratinjau kamera di layar utama setelah kamera berhasil diinisialisasi. Pengguna dapat mengambil gambar dengan menekan tombol kamera (ikon kamera) di kanan bawah, dan hasil gambar akan ditampilkan pada halaman baru.
