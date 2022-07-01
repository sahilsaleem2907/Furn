import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:uifurn/constants.dart';

import '../../../services/fetchProducts.dart';
import '../../../size_config.dart';
import 'justInProducts.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize as double;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultSize * 2, vertical: defaultSize * 5),
              child: SearchBarAnimation(
                textEditingController: TextEditingController(),
                buttonIconColour: kBackgroundColor,
                searchBoxColour: kSecondaryColor,
                isOriginalAnimation: true,
                hintText: "Search",
                hintTextColour: Colors.black,
                buttonBorderColour: kPrimaryColor,
                cursorColour: kBackgroundColor,
                buttonColour: kSecondaryColor,
                buttonIcon: Icons.search,
                onFieldSubmitted: (String value) {},
              ),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Center(
                        child: FadeIn(
                          duration: Duration(seconds: 2),
                          child: Text(
                            'Just In',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: defaultSize * 3, //16
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Container();
              },
            ),
            // Right Now product is our demo product
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(products: snapshot.data as dynamic)
                    : Center(
                        child: Container(
                            height: defaultSize * 14.5,
                            child: Image.asset('assets/spinner.gif')),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
