import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class AnnouncementScreen extends StatefulWidget {
  AnnouncementScreen();

  @override
  AnnScreenState createState() => AnnScreenState();
}

class AnnScreenState extends State<AnnouncementScreen> {
  AnnScreenState();

  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('announcements')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              padding: EdgeInsets.all(60),
              children: snapshot.data.docs.map((document) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    //padding: EdgeInsets.all(40),
                    width: MediaQuery.of(context).size.width / 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.yellow[400],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        //_launchURL(document['url']);
                      },
                      child: Column(
                        children: <Widget>[
                          /*Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text("Announcement", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                          ),*/
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(document['title'],
                                style: TextStyle(
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Text(document['description'], style: TextStyle()),
                            /*child: CachedNetworkImage(
                              imageUrl: document['emoji'],
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            )
                          ),*/
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
