import 'package:app/pages/hiragana_page.dart';
import 'package:app/pages/katakana_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 148, 148),
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 148, 148),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HiraganaPage(
                    title: 'hiragana',
                  ),
                ),
              ),
              child: const Text('Hiragana'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KatakanaPage(
                    title: 'katakana',
                  ),
                ),
              ),
              child: const Text('Katakana'),
            ),
          ],
        ),
      ),
    );
  }
}
