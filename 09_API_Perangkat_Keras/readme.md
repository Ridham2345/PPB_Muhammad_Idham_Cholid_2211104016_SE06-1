# Cover #
<div align="center">
LAPORAN PRAKTIKUM <br>
PEMROGRAMAN PERANGKAT BERGERAK <br>
<br>
MODUL IX <br>
API PERANGKAT KERAS<br>

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


# Guided

## Source Code `main.dart`:
```
import 'package:flutter/material.dart';
import 'package:flutter_9/Myapi_page.dart';

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
      home: MyApiPageState());
}
}
```

## Source Code `image_picker_screen.dart`:
```
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFromGalleryEx extends StatefulWidget {
 final ImageSourceType type;
 ImageFromGalleryEx(this.type);

 @override
 ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
 File? _image;
 late ImagePicker imagePicker;
 final ImageSourceType type;

 ImageFromGalleryExState(this.type);

 @override
 void initState() {
   super.initState();
   imagePicker = ImagePicker();
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(type == ImageSourceType.camera
           ? "Image from Camera"
           : "Image from Gallery"),
     ),
     body: Column(
       children: <Widget>[
         SizedBox(height: 52),
         Center(
           //mengambil gambar dari camera atau gallery
           child: GestureDetector(
             onTap: () async {
               //operasi ternary untuk memilih sumber gambar
               var source = type == ImageSourceType.camera
                   ? ImageSource.camera
                   : ImageSource.gallery;

               //menyimpan gambar pada variabel image
               XFile? image = await imagePicker.pickImage(
                   source: source,
                   imageQuality: 50,
                   preferredCameraDevice: CameraDevice.front);

               if (image != null) {
                 setState(() {
                   _image = File(image.path);
                 });
               }
             },
             child: Container(
               width: 200,
               height: 200,
               decoration: BoxDecoration(
                 color: Colors.red[200],
               ),

               // menampilkan gambar dari camera atau gallery
               child: _image != null
                   ? Image.file(
                       _image!,
                       width: 200.0,
                       height: 200.0,
                       fit: BoxFit.fitHeight,
                     )

                   // jika tidak ada gambar yang dipilih
                   : Container(
                       decoration: BoxDecoration(
                         color: Colors.red[200],
                       ),
                       width: 200,
                       height: 200,
                       child: Icon(
                         Icons.camera_alt,
                         color: Colors.grey[800],
                       ),
                     ),
             ),
           ),
         ),
       ],
     ),
   );
 }
}

enum ImageSourceType { camera, gallery }
```

## Source Code `myapi_page.dart`:
```
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

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Api Perangkat Keras", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 34, 34, 33),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Pastikan kamera sudah diinisialisasi
            await _initializeControllerFuture;
            // Ambil gambar
            final image = await _controller.takePicture();
            // Tampilkan atau gunakan gambar
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureScreen(imagePath: image.path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera_alt),
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
      appBar: AppBar(title: Text('Display Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}

```

## Output Code

Halaman Beranda

![Screenshot 2024-11-18 222647](https://github.com/user-attachments/assets/836a497d-896b-40e5-b511-3afa00211c64)

Hasil Foto

![Screenshot 2024-11-18 221538](https://github.com/user-attachments/assets/5a256810-b1ee-48a3-934e-612c1cd532c0)


# Unguided
## Source Code `main.dart`:
```
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

```

## Source Code `image_picker_screen.dart`;
```
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
```

## Source Code `myapi_page.dart`:
```
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
```
## Output

1. Halaman Beranda
   
   ![Screenshot 2024-11-18 231714](https://github.com/user-attachments/assets/b4529bc6-038f-4a6b-91db-8be7da7dbf93)

3. Hasil Dari Camera
   
![Screenshot 2024-11-18 225908](https://github.com/user-attachments/assets/dc0cd7a5-a2f3-48d4-83cb-e295cba72bdb)

3. Hasil Dari Galeri
   
![Screenshot 2024-11-18 231518](https://github.com/user-attachments/assets/93d2a4a2-8f1a-48b0-8da9-0d67aca8f6e1)

Penjelasan 

Code ini adalah implementasi aplikasi sederhana Flutter untuk mengakses kamera perangkat menggunakan library camera. Aplikasi akan menampilkan pratinjau kamera di layar utama setelah kamera berhasil diinisialisasi. Pengguna dapat mengambil gambar dengan menekan tombol kamera (ikon kamera) di kanan bawah, dan hasil gambar akan ditampilkan pada halaman baru.

