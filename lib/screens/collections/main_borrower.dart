import 'package:admin/screens/collections/pay_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';


class BorrowerList extends StatefulWidget {
  //SchoolList({Key key}) : super(key: key);
  //static final String path = "lib/src/pages/lists/list2.dart";
  @override
  _BorrowerListState createState() => _BorrowerListState();
}

class _BorrowerListState extends State<BorrowerList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  late Future _data;

  Future getBorrower() async {
    var firestore = FirebaseFirestore.instance;
    // ignore: deprecated_member_use
    QuerySnapshot qn = await firestore.collection("user").get();
    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot b) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PayCollection(
                  borrower: b,
                )));
  }

  @override
  void initState() {
    super.initState();
    _data = getBorrower();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 145),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: FutureBuilder(
                      future: _data,
                      builder: (_, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Text("Loading...."),
                          );
                        } else {
                          return ListView.builder(
                              itemCount: (snapshot.data as dynamic).length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () =>
                                        navigateToDetail((snapshot.data as dynamic)[index]),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      width: double.infinity,
                                      height: 110,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 50,
                                            height: 50,
                                            margin: EdgeInsets.only(right: 15),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  width: 3, color: secondary),
                                              // image: DecorationImage(
                                              //     image: NetworkImage(schoolLists[index]['logoText']),
                                              //     fit: BoxFit.fill),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  (snapshot.data as dynamic)[index]
                                                      .data()['name'],
                                                  style: TextStyle(
                                                      color: primary,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.location_on,
                                                      color: secondary,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        (snapshot.data as dynamic)[index]
                                                            .data()['address'],
                                                        style: TextStyle(
                                                            color: primary,
                                                            fontSize: 13,
                                                            letterSpacing: .3)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.phone,
                                                      color: secondary,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        (snapshot.data as dynamic)[index]
                                                            .data()['phoneNum'],
                                                        style: TextStyle(
                                                            color: primary,
                                                            fontSize: 13,
                                                            letterSpacing: .3)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                              });
                        }
                      })),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: CustomColors.firebaseAmber,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Collection",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search Borrower",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
