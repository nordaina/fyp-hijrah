import 'package:flutter/material.dart';
import '/widgets/call_to_action/call_to_action.dart';
import '/widgets/intro_details/intro_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CourseDetails(),
        SizedBox(
          height: 100,
        ),
        CallToAction('Apply Now'),
      ],
    );
  }
}
