import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '/widgets/centered_view/centered_view.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key key}) : super(key: key);

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
                ? 20
                : 30;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 10
                : 16;

        return Container(
            width: 800,
            child: CenteredView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'History',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      height: 0.9,
                      fontSize: titleSize,
                      //color: Colors.red
                    ),
                    textAlign: textAlignment,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sejak tahun 2015, Kerajaan Negeri Selangor telah memperuntukkan sebanyak RM139 juta bagi HIJRAH SELANGOR memberikan pinjaman mikro kredit kepada usahawan kecil negeri Selangor bagi perlaksanaan program membantu usahawan kecil mengembangkan perniagaan mereka serta menambah modal.',
                    style: TextStyle(
                      fontSize: descriptionSize,
                      height: 1.7,
                      // color: Colors.white
                    ),
                    textAlign: textAlignment,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Vision',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      height: 0.9,
                      fontSize: titleSize,
                      //color: Colors.red
                    ),
                    textAlign: textAlignment,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Peneraju mikrokredit yang unggul di negeri Selangor.',
                    style: TextStyle(
                      fontSize: descriptionSize,
                      height: 1.7,
                      // color: Colors.white
                    ),
                    textAlign: textAlignment,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Mission',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      height: 0.9,
                      fontSize: titleSize,
                      //color: Colors.red
                    ),
                    textAlign: textAlignment,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Menyediakan kemudahan pembiayaan yang berterusan kepada usahawan.',
                    style: TextStyle(
                      fontSize: descriptionSize,
                      height: 1.7,
                      // color: Colors.white
                    ),
                    textAlign: textAlignment,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
