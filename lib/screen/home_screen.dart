import 'package:apk_translate/data/langage_code.dart';
import 'package:apk_translate/model/translate_response.dart';
import 'package:apk_translate/service/translate_service.dart';
import 'package:apk_translate/style/color.dart';
import 'package:apk_translate/widget/dropBottoncustom.dart';
import 'package:apk_translate/widget/item_aternatif_translate.dart';
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
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    var myAppBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Text(
            "Translate",
            style: TextStyle(color: thread, fontSize: 20),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            " Language",
            style: TextStyle(color: fouth, fontSize: 20),
          ),
        ],
      ),
      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: buttonSubmit, shape: const StadiumBorder()),
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              setState(() {});
            },
            child: Text(
              "Translate",
              style: TextStyle(
                  color: fouth, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30, left: 15),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: first,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(color: second),
                      boxShadow: [
                        BoxShadow(
                            color: thread.withOpacity(0.5),
                            blurRadius: 4,
                            offset: const Offset(0, 4)),
                      ],
                    ),
                    child: TextField(
                      maxLines: 6,
                      controller: textControler,
                      decoration: const InputDecoration(
                        hintText: "Masukan Text",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Positioned(
                    top: mediaQueryHeight * 0.004,
                    child: Container(
                      width: mediaQueryWidth * 0.7,
                      decoration: BoxDecoration(
                        color: first,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        border: Border.all(color: second, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: thread.withOpacity(0.5),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
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
                    ),
                  ),
                ],
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          width: mediaQueryWidth,
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 15),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: fouth,
                          ),
                          child: Text(
                            _dataTranslate!.responseData.translatedText,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: first,
                            border: Border.all(
                              color: second,
                              width: 3,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alternatif Translate",
                                style: TextStyle(color: fouth),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: _dataTranslate.matches.length,
                                itemBuilder: (context, index) {
                                  return ItemALternatifTranslate(
                                    arti: _dataTranslate
                                        .matches[index].translation,
                                    kalimat:
                                        _dataTranslate.matches[index].segment,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
