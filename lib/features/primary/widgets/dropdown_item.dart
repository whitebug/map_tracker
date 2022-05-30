import 'package:flutter/material.dart';
import 'package:map_tracker/features/primary/service/model/menu_item.dart';

/// UI for [DropdownMenuWidget]'s item
class DropdownItem extends StatelessWidget {
  /// Item's data
  final MapMenuItem item;

  /// Colors for icon and item's text
  final Color color;

  const DropdownItem({required this.item, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(item.icon, color: color, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: TextStyle(
            color: color,
          ),
        ),
      ],
    );
  }
}
