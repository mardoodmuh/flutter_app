import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.examples,
      required this.vowel,
      required this.hiragana,
      required this.kanaType});
  final String hiragana;
  final String vowel;
  final List<Widget> examples;
  final String kanaType;

  @override
  Widget build(BuildContext context) {
    bool hasPhoto = kanaType == 'Gojuuon' ||
        kanaType == 'Dakuon' ||
        kanaType == 'Handakuon' ||
        kanaType == 'Sokuon';
    return Card(
      margin: const EdgeInsets.all(6),
      color: const Color.fromARGB(255, 0, 132, 132),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  hiragana,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(vowel,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    )),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_up,
                    size: 30,
                  ),
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: examples,
                ),
                const Spacer(),
                hasPhoto
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://mardood.pythonanywhere.com//media/hiragana/static/150x150/$hiragana.png',
                          width: 90,
                          height: 90,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
