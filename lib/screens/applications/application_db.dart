import 'package:admin/models/RecentFile.dart';
import 'package:admin/screens/applications/t1_appDetail.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';

class Applist extends StatefulWidget {
  @override
  _listState createState() => _listState();
}

class _listState extends State<Applist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Credit Applications",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('applications')
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return DataTable2(
                        columnSpacing: defaultPadding,
                        minWidth: 600,
                        showCheckboxColumn: false,
                        columns: [
                          //DataColumn(label: Text("ID")),
                          DataColumn(label: Text("Scheme")),
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Amount (RM)")),
                        ],
                        rows: _createRows(snapshot.data!),
                      );
                      
                    }
      ),
          ))]));
  }

  List<DataRow> _createRows(QuerySnapshot snapshot) {
    List<DataRow> newList =
        snapshot.docs.map((DocumentSnapshot documentSnapshot) {
      return new DataRow(
          cells: [
            DataCell(Text(documentSnapshot['scheme'] ?? '')),
            DataCell(Text(documentSnapshot['applicant_name'] ?? '')),
            DataCell(Text(documentSnapshot['requested_amt'] ?? '')),
          ],
          onSelectChanged: (selected) {
            if (selected!) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppDetails(
                      app:
                          documentSnapshot), //DetailScreen(todo: _items[index]),
                ),
              );
            }
          });
    }).toList();

    return newList;
  }
}
