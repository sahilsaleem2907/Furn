import 'package:flutter/material.dart';

import '../../../components/title_text.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize as double;
    return GestureDetector(
      onTap: press as Function(),
      child: Stack(
        children: [
          Container(
            child: AspectRatio(
              aspectRatio: 1.025,
              child: Container(
                width: defaultSize * 14.5, //145
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: AspectRatio(
                    aspectRatio: 0.693,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: defaultSize * 2,
                        ),
                        Container(
                          height: defaultSize * 20,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Hero(
                              tag: product.id,
                              child: FadeInImage.assetNetwork(
                                placeholder: "assets/spinner.gif",
                                image: product.image,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: defaultSize * 2,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultSize),
                          child: TitleText(title: product.title),
                        ),
                        SizedBox(height: defaultSize / 2),
                        Text(
                          "\₹${product.price}",
                          style: TextStyle(
                            fontSize: defaultSize * 1.6, //16
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                            height: 1.6,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
