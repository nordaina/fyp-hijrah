import 'package:flutter/material.dart';
import '/routing/route_names.dart';
import '/widgets/navigation_bar/navbar_item.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          NavBarItem('Home', HomeRoute); //KIV
        },
        child: SizedBox(
          height: 80,
          width: 150,
          child: Image.asset('assets/logo.png'),
        ));
  }
}
