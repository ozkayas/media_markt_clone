import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/product.dart';

class MiniProductCard extends StatelessWidget {
  const MiniProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.3,
      color: Colors.grey,
      child: Column(
        children: [
          Image.network(
              'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_87302616/fee_786_587_png/APPLE-iPhone-13-Pro-Max-256-GB-Ak%C4%B1ll%C4%B1-Telefon-Sierra-Blue'),
        ],
      ),
    );
  }
}
