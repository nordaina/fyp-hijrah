import 'package:flutter/material.dart';
import '/widgets/call_to_action/call_to_action.dart';
import '/widgets/intro_details/intro_details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CourseDetails(),
        Expanded(
          child: Center(
            child: CallToAction('Apply Now'),
          ),
        )
      ],
    );
  }
}
