import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '/constants/app_colors.dart';
import '/widgets/centered_view/centered_view.dart';
import '/widgets/navigation_bar/navigation_bar.dart';
import '/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            NavigationBar(),
            Expanded(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
