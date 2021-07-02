import 'package:flutter/material.dart';
import '/widgets/navigation_drawer/draweritem_home.dart';
import 'announcements/announcement_overview.dart';
import 'applications/application_overview.dart';
import 'collections/Calendar.dart';
// import '../application_screen.dart';
// import 'profile_screen.dart';
// import '../announcement_screen.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen();
  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState();
  int _currentPage = 0;
  final List<Widget> _pages = [
    AnnouncementScreen(),
    ApplicationScreen(),
    HomeCalendarPage()
  ];

  List<bool> isHighlighted = [true, false, false];
  final drawerItems = [
    new DrawerItem("Announcement", Icons.announcement_rounded),
    new DrawerItem("Application", Icons.approval),
    new DrawerItem("Collection", Icons.money_off)
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Drawer(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      for (int i = 0; i < isHighlighted.length; i++) {
                        setState(() {
                          if (index == i) {
                            isHighlighted[index] = true;
                            _currentPage = index;
                          } else {
                            //the condition to change the highlighted item
                            isHighlighted[i] = false;
                          }
                        });
                      }
                    },
                    child: Container(
                      color:
                          isHighlighted[index] ? Colors.grey[50] : Colors.white,
                      child: ListTile(
                        //the item
                        leading: Icon(drawerItems[index].icon, color: isHighlighted[index] ? Colors.red : Colors.grey,),
                        title: Text(drawerItems[index].title, style: isHighlighted[index] ? TextStyle(color: Colors.red) : TextStyle(color: Colors.grey)),
                      ),
                    ),
                  );
                }),
          ),
        ),
        Expanded(
          child: Scaffold(
            body: _pages[_currentPage],
          ),
        ),
      ],
    );
    /* return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gentelella Admin'),
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              Drawer(
                child: ListView(
                  children: <Widget>[
                    DrawerHeader(
                      //padding: EdgeInsets.zero,
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                      child:
                      Column(
                        children: <Widget>[
                          
                          Row(
                            children: <Widget>[
                              SizedBox(height: 34,),
                               ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(
                                          "https://colorlib.com/polygon/gentelella/images/img.jpg",
                                          width: 56,
                                        ),
                              ),
SizedBox(width: 20,),
                              Flexible(
                                child: Stack(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('Welcolme', style: TextStyle(fontSize: 13, color: Color(0xffBAB8B8))),
                                        
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[SizedBox(height: 48,),
                                Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffECF0F1)),),],
                                    )
                                     
                                    
                                  ],
                                ),
                              )
                              
                              
                              
                            ],
                          ),
                         
                        ],

                      ) ,
                      decoration: BoxDecoration(
                        color: Color(0xff2A3F54),
                      ),
                    ),
                    ListTile(
                      title: Text('Principal'),
                      onTap: () {
//                      HomePage();
                        setState(() {
                          _currentPage = 0;
                        });
                      },
                    ),

                    ListTile(
                      title: Text('Add receipt'),
                      onTap: () {
//                      HomePage();
                        setState(() {
                          _currentPage = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              _pages[_currentPage],
              //HomePage(),
            ],
          ),
        ),
      ),
    );
 */
  }
}
