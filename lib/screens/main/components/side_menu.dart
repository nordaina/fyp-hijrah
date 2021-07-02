import 'package:admin/screens/announcements/dashboard.dart';
import 'package:admin/screens/applications/main_app.dart';
import 'package:admin/screens/collections/main_borrower.dart';
import 'package:admin/screens/system-admin/add_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo2.png"),
          ),
          DrawerListTile(
            title: "Dashbord",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              
            },
          ),
          DrawerListTile(
            title: "Announcement",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Application",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              ApplicationScreen();
            },
          ),
          DrawerListTile(
            title: "Collection",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BorrowerList()));
            },
          ),
          // DrawerListTile(
          //   title: "Task assignment",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   press: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => AddUser()));
          //   },
          // ),
          // DrawerListTile(
          //   title: "Store",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Microentrepeneur",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => BorrowerList()));
          //   },
          // ),
          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/icons/menu_setting.svg",
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.black,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
