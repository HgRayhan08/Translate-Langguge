import 'package:apk_translate/data/langage_code.dart';
import 'package:apk_translate/service/translate_service.dart';
import 'package:apk_translate/widget/dropBottoncustom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textControler = TextEditingController();
  String dropdownPertama = "pilih bahasa";
  String dropdowndua = "pilih bahasa";
  String terjemahan = "";
  String targetpertama = "";
  String targetkedua = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translate"),
        actions: [
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  if (dropdownPertama != "pilih bahasa" &&
                      dropdowndua != "pilih bahasa") {
                    targetpertama = languageCodes[dropdownPertama]!;
                    targetkedua = languageCodes[dropdowndua]!;
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const Dialog(
                        child: Center(
                          heightFactor: 1.5,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Pilih Bahasa",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  setState(() {});
                },
                child: Text("data")),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropButtonCustom(
                  item: languages,
                  judul: dropdownPertama,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownPertama = newValue!;
                    });
                  },
                ),
                DropButtonCustom(
                  item: languages,
                  judul: dropdowndua,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowndua = newValue!;
                    });
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              child: TextField(
                maxLines: 5,
                controller: textControler,
                decoration: const InputDecoration(hintText: "Masukan Text"),
              ),
            ),
            FutureBuilder(
              future: translate().getTranslate(
                textNilai: textControler.text,
                target: targetpertama,
                language: targetkedua,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // ignore: no_leading_underscores_for_local_identifiers
                  var _dataTranslate = snapshot.data;
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_dataTranslate!.responseData.translatedText),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _dataTranslate.matches.length,
                            itemBuilder: (context, index) {
                              return Text(
                                _dataTranslate.matches[index].translation,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
