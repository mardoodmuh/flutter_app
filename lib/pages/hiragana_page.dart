import 'package:app/models/hiragana_response.dart';
import 'package:app/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HiraganaPage extends StatelessWidget {
  const HiraganaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'hiragana'.toUpperCase(),
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
                        ...data[index].hiragana.map(
                          (e) {
                            return CardWidget(
                              hiragana: e.hiragana,
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
