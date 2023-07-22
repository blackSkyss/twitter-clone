import 'package:flutter/material.dart';
import '../../../../config/themes/theme_export.dart';

class ListTilePayment extends StatelessWidget {
  final int payMethod;
  final double width;
  final String path;
  final String title;
  final int value;
  final Function(int) onChange;
  const ListTilePayment({
    Key? key,
    required this.payMethod,
    required this.width,
    required this.path,
    required this.title,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(value);
      },
      child: ListTile(
        tileColor: Pallete.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: payMethod == value
              ? const BorderSide(color: Pallete.greyColor)
              : const BorderSide(color: Pallete.whiteColor),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 6),
          child: Image.asset(
            path,
            width: width,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Pallete.backgroundColor,
          ),
        ),
        trailing: Radio(
          value: value,
          groupValue: payMethod,
          onChanged: (val) {
            onChange(val!);
          },
        ),
      ),
    );
  }
}
