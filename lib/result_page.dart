import 'package:flutter/material.dart';
import 'package:belajar_flutter/widgets/custom_button.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.text});

  final int text;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget ke-2')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                '${widget.text}',
                style: const TextStyle(fontSize: 70, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: 'Back to previous page',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Material Dialog'),
                    content: const Text('Do you want to previous page?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('Back to previous page (with alert)'),
            ),
          ],
        ),
      ),
    );
  }
}
