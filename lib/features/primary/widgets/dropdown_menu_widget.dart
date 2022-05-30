import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownMenuWidget extends StatelessWidget {
  final Widget icon;
  final List<DropdownMenuItem<Object>> items;
  final BoxDecoration dropdownDecoration;
  final void Function(Object?)? onChanged;

  const DropdownMenuWidget({
    required this.icon,
    required this.items,
    required this.dropdownDecoration,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: icon,
        items: items,
        onChanged: onChanged,
        itemHeight: 48,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 250,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: dropdownDecoration,
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }
}
