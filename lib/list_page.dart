import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewWidget(),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final List bulan = [
    "Januari",
    "Fabruari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];
  final colorCodes = [
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blue,
    Colors.yellow,
    Colors.white,
    Colors.orange,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget ke-3')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            color: colorCodes[index],
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Bulan: ${bulan[index]}',
                    style: const TextStyle(fontSize: 30))),
          );
        },
        itemCount: bulan.length,
      ),
    );
  }
}
