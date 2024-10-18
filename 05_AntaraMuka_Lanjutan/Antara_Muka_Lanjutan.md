<div align="center">
TUGAS PENDAHULUAN <br>
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


```
Output Code: 
![listviewbuilder](img/1.listView.builder.png)
## 2. ListView.separated
Source Code:
```
import 'package:flutter/material.dart';

class ListViewSeparatedExample extends StatelessWidget {
  const ListViewSeparatedExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> colorCodes = <int>[600, 500, 100];
    final List<String> entries = <String>['A', 'B', 'C'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView.separated"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Text('Entry ${entries[index]}'),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

```
Output Code: 
![listviewseparated](img/2.listView.separated.png)
## 3. Flexible and Expanded
Source Code:
```
import 'package:flutter/material.dart';
void main() {
  runApp(const FlexibleExpandedScreen(title: 'Flexible and Expanded Demo'));
}

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
![flexibleandexpanded](img/3.flexibleAndExpanded.png)
## 4. CustomScrollView
Source Code:
```
import 'package:flutter/material.dart';

class CustomScrollViewExample extends StatelessWidget {
  const CustomScrollViewExample({super.key});

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
![customscrollview](img/4.customScrollView.png)



