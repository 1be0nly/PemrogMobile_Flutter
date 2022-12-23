import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:belajar_flutter/result_page.dart';
import 'package:belajar_flutter/widgets/custom_button.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var listWarna = [
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blue,
    Colors.yellow
  ];

  int index = 0;

  void _increment() {
    setState(() {
      index++;
    });
  }

  void _decrement() {
    setState(() {
      index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Widget')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '$index',
                style: TextStyle(
                    fontSize: 70, color: listWarna[index % listWarna.length]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tekan tombol di bawah untuk mengubah value',
                style: TextStyle(fontSize: 25, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decrement,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: _increment, child: const Icon(Icons.add)),
                ],
              ),
              CustomButton(
                  text: 'Go to result page',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(text: index),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: 'Toast Massage : ${index}',
              backgroundColor: Colors.amber.withOpacity(0.5),
              textColor: Colors.black,
              gravity: ToastGravity.BOTTOM,
            );
          },
          child: const Icon(Icons.numbers)),
    );
  }
}
