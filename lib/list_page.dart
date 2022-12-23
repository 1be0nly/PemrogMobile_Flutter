import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List bulan = [
    "Januari",
    "Februari",
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ListView Widget')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: 'Bulan Ke-${index + 1}',
                      backgroundColor: Colors.white.withOpacity(0.5),
                      textColor: Colors.black,
                      gravity: ToastGravity.BOTTOM);
                },
                child: Container(
                  color: colorCodes[index],
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Bulan: ${bulan[index]}',
                          style: const TextStyle(fontSize: 30))),
                ));
          },
          itemCount: bulan.length,
        ));
  }
}
