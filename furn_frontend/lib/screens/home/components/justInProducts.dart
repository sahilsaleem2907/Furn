import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../details/details_screen.dart';
import 'product_card.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  // Because our Api provie us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize as double;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
              product: products[index],
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
                      ),
                    ));
              });
        },
        itemCount: products.length,
        itemHeight: 500,
        itemWidth: 300.0,
        layout: SwiperLayout.STACK,
      ), //20
    );
  }
}
