import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, tumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.tumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: id,
              child: Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 15,
                      offset: Offset(10, 10),
                    ),
                  ],
                ),
                child: Image.network(
                  tumb,
                  headers: const {'Referer': 'https://comic.naver.com'},
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
