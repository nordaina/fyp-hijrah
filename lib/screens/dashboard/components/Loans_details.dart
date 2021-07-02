// import 'package:charts_flutter/flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'package:charts_flutter/flutter.dart' as charts;

// import 'loans.dart';

// class SalesHomePage extends StatefulWidget {
//   @override
//   _SalesHomePageState createState() {
//     return _SalesHomePageState();
//   }
// }

// class _SalesHomePageState extends State<SalesHomePage> {
//   List<charts.Series<Loans, String>>? _seriesBarData;
//   List<Loans>? mydata;
//   _generateData(mydata) {
//     _seriesBarData;
//     _seriesBarData!.add(
//       charts.Series(
//         domainFn: (Loans sales, _) => sales.borrower_id.toString(),
//         measureFn: (Loans sales, _) => sales.total,
//         // colorFn: (Loans sales, _) =>
//         //     charts.ColorUtil.fromDartColor(Color([2,2,2,2])),
//         id: 'Loans',
//         data: mydata,
//         labelAccessorFn: (Loans row, _) => "${row.borrower_id}",
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Loans')),
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('loans').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return LinearProgressIndicator();
//         } else {
//           List<Loans> sales = snapshot.data!.docs
//               .map((documentSnapshot) => Loans.fromMap(documentSnapshot.data()))
//               .toList();
//           return _buildChart(context, sales);
//         }
//       },
//     );
//   }

//   Widget _buildChart(BuildContext context, List<Loans> saledata) {
//     mydata = saledata;
//     _generateData(mydata);
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Container(
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               Text(
//                 'Testing',
//                // style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Expanded(
//                 child: charts.PieChart(_seriesBarData,
//                     animate: true,
//                     animationDuration: Duration(seconds: 5),
//                     behaviors: [
//                       new charts.DatumLegend(
//                         outsideJustification:
//                             charts.OutsideJustification.endDrawArea,
//                         horizontalFirst: false,
//                         desiredMaxRows: 2,
//                         cellPadding: new EdgeInsets.only(
//                             right: 4.0, bottom: 4.0, top: 4.0),
//                         entryTextStyle: charts.TextStyleSpec(
//                             color: charts.MaterialPalette.purple.shadeDefault,
//                             fontFamily: 'Georgia',
//                             fontSize: 18),
//                       )
//                     ],
//                     defaultRenderer: new charts.ArcRendererConfig(
//                         arcWidth: 100,
//                         arcRendererDecorators: [
//                           new charts.ArcLabelDecorator(
//                               labelPosition: charts.ArcLabelPosition.inside)
//                         ])),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
