import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EpisodesView extends StatefulWidget {
  const EpisodesView({Key key}) : super(key: key);
  @override
  EpisodesViewState createState() => new EpisodesViewState();
}

class EpisodesViewState extends State<EpisodesView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('schemes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> documents = snapshot.data.docs;
          return new MyExpansionTileList(documents);
        });
  }
}

class MyExpansionTileList extends StatelessWidget {
  final List<dynamic> elementList;

  MyExpansionTileList(this.elementList);

  List<Widget> _getChildren() {
    List<Widget> children = [];
    elementList.forEach((element) {
      children.add(
        new MyExpansionTile(element['name'], element['description']),
      );
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _getChildren(),
    );
  }
}

class MyExpansionTile extends StatefulWidget {
  final String description;
  final String name;
  //final String image;
  MyExpansionTile(this.name, this.description);
  @override
  State createState() => new MyExpansionTileState();
}

class MyExpansionTileState extends State<MyExpansionTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 7),
        alignment: Alignment.topCenter,
        child: Card(
            elevation: 5,
            shadowColor: Colors.red,
            child: Column(children: <Widget>[
              ExpansionTile(
                title: new Text(widget.name,
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                children: <Widget>[
                  Divider(
                    height: 5,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Image.network(widget.image,height: 180,fit:BoxFit.fitWidth ,width: double.infinity,),
                  ListTile(
                    dense: true,
                    title: new Text(
                      widget.description,
                      style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),
            ])));
  }
}

class MyExpansionTileTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Text("Submitted Applications",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }
}
/*GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Text(snapshot.data.docs[index]['title']);
            },
            itemCount: snapshot.data.docs.length,
          );*/
