import 'package:flutter/material.dart';
import '/constants/app_colors.dart';
import '/dashboard/main-menu.dart';
import '/manager/dialog_manager.dart';
import '/routing/route_names.dart';
import '/services/dialog_service.dart';
import '/services/navigation_service.dart';

class CallToActionTabletDesktop extends StatelessWidget {
  final String title;
  const CallToActionTabletDesktop(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
        // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
        //  key: locator<DialogService>().dialogNavigationKey,
        // onGenerateRoute: (settings) => MaterialPageRoute(
        //     builder: (context) => DialogManager(child: child)),
        // locator<NavigationService>().navigateTo(SignUpViewRoute);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
