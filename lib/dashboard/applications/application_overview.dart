import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/constants/app_colors.dart';
import 'new_application_form.dart';
import 'view_application.dart';

class ApplicationScreen extends StatefulWidget {
  ApplicationScreen();

  @override
  _AppScreenState createState() => new _AppScreenState();
}

class _AppScreenState extends State<ApplicationScreen> {
  Future getApplications() async {
    var fs = FirebaseFirestore.instance;
    QuerySnapshot qn = await fs.collection("applications").get();
    return qn.docs;
  }

  navigateDetail(DocumentSnapshot app) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AppDetailsPage(
                  app: app,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
          padding: EdgeInsets.all(40),
          alignment: Alignment.topRight,
          child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppFormPage(),
                  ),
                );
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              elevation: 5,
              color: primaryColor,
              child: new Text(
                "Create new",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))),
      Container(
        child: Text("Submitted Applications",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
      Expanded(
        child: FutureBuilder(
            future: getApplications(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    padding: EdgeInsets.all(60),
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      //children: snapshot.data.docs.map((document) {
                      //return Center(
                      return ListTile(
                        tileColor: Colors.yellow,
                        title: Text(snapshot.data[index]['scheme']),
                        onTap: () {
                          navigateDetail(snapshot.data[index]);
                        },
                      );
                      //child: Container(
                      // padding: EdgeInsets.all(20),
                      //child: Text(

                      // style: TextStyle(fontSize: 15),
                      // ),
                      // ),

                      //);
                    });
              }

              /*StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('applications')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }*/

              /*
                return DataTable(
                showCheckboxColumn: false,
                columns: [
                DataColumn(label: Text("Application Name")),
                DataColumn(label: Text("Status"))
               ], 
               rows: snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                 return new DataRow(cells: [
                  DataCell(Text(documentSnapshot.data()['appID'])),
                  DataCell(Text(documentSnapshot.data()['appStatus']))
                 ]
                 //onselected
                 );
               
                }).toList(),*/
              // );
            }),
      )
    ]));
  }
}
