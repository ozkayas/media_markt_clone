import 'package:flutter/material.dart';
import 'package:media_markt_clone/models/product.dart';

class MiniProductCard extends StatelessWidget {
  const MiniProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      double imageHeight = constraints.maxHeight * 0.3;
      // print('constraints.minHeight');
      // print(constraints.minHeight);
      // print(constraints.maxHeight);
      // print(constraints.minWidth);
      // print(constraints.maxWidth);
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                  constraints: BoxConstraints(
                      minHeight: imageHeight, maxHeight: imageHeight),
                  child:
                      Image.network(product.imageUrl, fit: BoxFit.fitHeight)),
            ),
            Text(
              product.name,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Flexible(
                child: Text(
              product.description,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )),
            Text(
              '${(product.price.toInt())},-',
              style: TextStyle(
                fontSize: 36,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    offset: Offset(3, 3),
                    blurRadius: 5.0,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
