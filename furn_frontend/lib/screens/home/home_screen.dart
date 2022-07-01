import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:uifurn/screens/home/components/body.dart';

import '../../constants.dart';
import '../../size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize as double;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RefreshIndicator(
              color: kSecondaryColor,
              backgroundColor: kBackgroundColor,
              onRefresh: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Stack(children: [Center(child: Body())]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              svgPath: "assets/icons/user.svg", extras: {"label": "user"}),
          FluidNavBarIcon(
              svgPath: "assets/icons/home.svg", extras: {"label": "home"}),
          FluidNavBarIcon(
              svgPath: "assets/icons/bag.svg", extras: {"label": "bag"}),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
            barBackgroundColor: kSecondaryColor,
            iconSelectedForegroundColor: Colors.black,
            iconUnselectedForegroundColor: kBackgroundColor),
        scaleFactor: 1.5,
        defaultIndex: 1,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {}
}
