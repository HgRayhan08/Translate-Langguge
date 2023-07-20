import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropButtonCustom extends StatefulWidget {
  List<String> item;
  String judul;
  final Function(String?)? onChanged;
  DropButtonCustom(
      {super.key,
      required this.item,
      required this.judul,
      required this.onChanged});

  @override
  State<DropButtonCustom> createState() => _DropButtonCustomState();
}

class _DropButtonCustomState extends State<DropButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.judul,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: widget.item
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        // value: selectedValue,
        onChanged: widget.onChanged,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
