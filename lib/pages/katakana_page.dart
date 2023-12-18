import 'package:app/models/response.dart';
import 'package:app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class KatakanaPage extends StatelessWidget {
  const KatakanaPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 0, 148, 148),
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 148, 148),
        child: FutureBuilder(
          future: ApiService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While data is being fetched, show a loading indicator
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If there's an error, display an error message
              return Text('Error: ${snapshot.error}');
            } else {
              List<KanaTypes>? data = snapshot.data;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          data[index].kanaType,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        ...data[index].katakana.map(
                          (e) {
                            return CardWidget(
                              character: e.katakana,
                              vowel: e.vowel,
                              examples: [
                                ...e.ex.map((i) {
                                  return Text(
                                    '${i.word} ${i.meaning_capitalized}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  );
                                }).toList(),
                              ],
                              characters: title,
                              kanaType: data[index].kanaType,
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
