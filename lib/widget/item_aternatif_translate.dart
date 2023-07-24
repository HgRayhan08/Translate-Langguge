// ignore_for_file: must_be_immutable

import 'package:apk_translate/style/color.dart';
import 'package:flutter/material.dart';

class ItemALternatifTranslate extends StatelessWidget {
  String? arti;
  String? kalimat;
  ItemALternatifTranslate({super.key, this.arti, this.kalimat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          color: first,
          boxShadow: [
            BoxShadow(color: fouth, blurRadius: 6, offset: const Offset(2, 4)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            arti!,
          ),
          Text(kalimat!),
        ],
      ),
    );
  }
}
