
import 'package:flutter/material.dart';
import 'db_helper.dart';

class Addbiodata extends StatelessWidget {
  const Addbiodata({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: Halaman(),
    );
  }
}

class Halaman extends StatefulWidget {
  const Halaman({super.key});

  @override
  State<Halaman> createState() => _HalamanState();
}

class _HalamanState extends State<Halaman> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> biodata = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      biodata = data;
    });
  }

  void navigateAddData(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InputFormScreen()),
    );
    if (result == true) _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: Text('Biodata Mahasiswa', style: TextStyle(color: Colors.white)),
      ),
      body: biodata.isEmpty
          ? Center(child: Text('No Data'))
          : ListView.builder(
              itemCount: biodata.length,
              itemBuilder: (context, index) {
                final data = biodata[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: Colors.blue[50],
                  child: ListTile(
                    title: Text(
                      data['nama'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NIM: ${data['nim']}'),
                          Text('Alamat: ${data['alamat']}'),
                          Text('Hobi: ${data['hobi']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateAddData(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class InputFormScreen extends StatelessWidget {
  InputFormScreen({super.key});
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController hobiController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 1, 1),
        centerTitle: true,
        title: Text('Tambah Biodata Mahasiswa',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration:
                  InputDecoration(labelText: 'NAMA', icon: Icon(Icons.person)),
            ),
            TextField(
              controller: nimController,
              decoration: InputDecoration(
                  labelText: 'NIM', icon: Icon(Icons.confirmation_number)),
            ),
            TextField(
              controller: alamatController,
              decoration:
                  InputDecoration(labelText: 'ALAMAT', icon: Icon(Icons.home)),
            ),
            TextField(
              controller: hobiController,
              decoration: InputDecoration(
                  labelText: 'HOBI', icon: Icon(Icons.stars_sharp)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await dbHelper.insert({
                  'nama': namaController.text,
                  'nim': nimController.text,
                  'alamat': alamatController.text,
                  'hobi': hobiController.text,
                });
                Navigator.pop(context, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 6, 9, 10),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
