import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/drawer_item.dart';

class DrawerItemRow extends StatelessWidget {
  const DrawerItemRow({
    Key? key,
    required this.item,
  }) : super(key: key);
  final DrawerItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// TODO: navigate to item.route
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Row(
          children: [
            Icon(
              item.iconData,
              size: 26,
            ),
            SizedBox(
              width: 12,
            ),
            Text(item.label)
          ],
        ),
      ),
    );
  }
}
