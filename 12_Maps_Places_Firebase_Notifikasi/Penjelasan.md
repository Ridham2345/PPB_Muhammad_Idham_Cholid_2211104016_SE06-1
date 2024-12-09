# Penjelasan
HomePage Stateful Widget
Kelas ini digunakan untuk menampilkan peta Google Maps di layar aplikasi dan memungkinkan interaksi pengguna dengan marker serta Place Picker.

_initialMapCenter
Variabel yang menyimpan koordinat lokasi awal peta. Pada kode ini, lokasi awal diatur di wilayah Banyumas.

GoogleMapController
Controller yang berfungsi untuk mengatur peta, seperti menggerakkan kamera, memperbesar/memperkecil tampilan, dan menambahkan marker pada lokasi tertentu.

_createMarker()
Fungsi untuk membuat marker default di lokasi awal. Marker ini memiliki InfoWindow dengan teks "Rumah ku istanaku" untuk memberikan informasi tambahan.

_openPlacePicker()
Fungsi untuk membuka fitur Place Picker. Ketika pengguna memilih lokasi baru, kamera peta akan dipindahkan ke lokasi tersebut, dan marker tambahan akan dibuat di lokasi yang dipilih.

AppBar
Bagian atas aplikasi yang menampilkan tombol untuk mengakses Place Picker, disertai dengan judul aplikasi.

dispose()
Fungsi ini digunakan untuk membersihkan controller peta (GoogleMapController) agar tidak terjadi kebocoran memori ketika widget tidak lagi digunakan.

Tujuan Aplikasi
Aplikasi ini bertujuan untuk menyediakan tampilan peta interaktif dan memungkinkan pengguna untuk memilih lokasi menggunakan Place Picker. Setelah lokasi dipilih, aplikasi akan menampilkan marker baru di lokasi tersebut.

## Source Code
  1. Main.dart
     
     ![code](https://github.com/user-attachments/assets/19bb6467-bd8c-42d5-902a-d4ad9cee551d)

  3. MyHome.dart

     ![code](https://github.com/user-attachments/assets/8963c8e0-580a-486d-a00d-71e27983dcb1)

     Output

![Output 1 ](https://github.com/user-attachments/assets/3db52e9b-5b41-4470-816c-e3893cbb24b1)
     
![Output 2](https://github.com/user-attachments/assets/21490629-5479-4335-924d-e616e43afa64)

     



     
  
