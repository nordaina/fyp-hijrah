import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '/widgets/centered_view/centered_view.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
                ? TextAlign.left
                : TextAlign.center;
        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 50
                : 80;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 16
                : 21;

        return Container(
            width: 800,
            child: CenteredView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Selangor Hijrah Scheme',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      height: 0.9,
                      fontSize: titleSize,
                      //color: Colors.red
                    ),
                    textAlign: textAlignment,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Integrated microcredit program is an initiative of Selangor State Government to expand middle class through the implementation approach of an efficient additional capital distribution system to small traders.',
                    style: TextStyle(
                      fontSize: descriptionSize,
                      height: 1.7,
                      // color: Colors.white
                    ),
                    textAlign: textAlignment,
                  )
                ],
              ),
            ));
      },
    );
  }
}
