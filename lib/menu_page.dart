import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://picsum.photos/250?image=1",
      "https://picsum.photos/250?image=2",
      "https://picsum.photos/250?image=3",
      "https://picsum.photos/250?image=4",
      "https://picsum.photos/250?image=5",
      "https://picsum.photos/250?image=6",
      "https://picsum.photos/250?image=7",
      "https://picsum.photos/250?image=8",
      "https://picsum.photos/250?image=9",
      "https://picsum.photos/250?image=10",
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView Widget"),
        ),
        body: Container(
            padding: const EdgeInsets.all(4),
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: 'Ini Gambar Ke-${index + 1}',
                            backgroundColor: Colors.white.withOpacity(0.5),
                            textColor: Colors.black,
                            gravity: ToastGravity.BOTTOM);
                      },
                      child: Image.network(images[index]));
                })),
      ),
    );
  }
}
