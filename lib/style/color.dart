import 'package:flutter/material.dart';

Color first = const Color(0xffF4F9F9);
Color second = const Color(0xffCCF2F4);
Color thread = const Color(0xffA4EBF3);
Color fouth = const Color(0xff394867);
Color buttonSubmit = const Color(0xffA2FF86);


// FutureBuilder(
//                   future: translate().getTranslate(
//                     textNilai: textControler.text,
//                     target: targetpertama,
//                     language: targetkedua,
//                   ),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       // ignore: no_leading_underscores_for_local_identifiers
//                       var _dataTranslate = snapshot.data;
//                       return Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(_dataTranslate!.responseData.translatedText),
//                             Expanded(
//                               child: ListView.builder(
//                                 itemCount: _dataTranslate.matches.length,
//                                 itemBuilder: (context, index) {
//                                   return Text(
//                                     _dataTranslate.matches[index].translation,
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                     return Container();
//                   },
//                 ),