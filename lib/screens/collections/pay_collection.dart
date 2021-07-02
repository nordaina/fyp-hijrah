import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class PayCollection extends StatefulWidget {
  final DocumentSnapshot borrower;
  PayCollection({
    Key? key,
    required this.borrower,
  }) : super(key: key);

  @override
  _PayCollectionState createState() => _PayCollectionState();
}

class _PayCollectionState extends State<PayCollection> {
  String _amount = "";
  // String _creditCardNumber = "";
  // String _securityCode = "";

  var checkbox1 = false;
  DateTime date = DateTime.now();

  //GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Collection'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                FlutterToggleTab(
                  // width in percent, to set full width just set to 100
                  width: 50,
                  borderRadius: 30,
                  height: 50,
                  initialIndex: 0,
                  selectedBackgroundColors: [Colors.amber[400]!],
                  selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  unSelectedTextStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  labels: ["Details", "Payment"],
                  selectedLabelIndex: (index) {
                    setState(() {
                      if (index == 0)
                        print("Selected Index details");
                      else
                        print("Selected Index pay");
                    });
                  },
                ),

//CREATE METHOD TO DISPLAY DETAILS
                Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 96.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.borrower['name'],
                                  style: Theme.of(context).textTheme.title,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(widget.borrower['phoneNum']),
                                  subtitle: Text(widget.borrower['address']),
                                ),
                              ],
                            ),
                          ),
                        ])),
                Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                _amount = value;
                              });
                            },
                            decoration:
                                InputDecoration(labelText: "Amount (RM)",),
                          ),
                          SizedBox(height: 10.0),
                          // Row(children: [
                          //   SizedBox(
                          //     width: 10,
                          //     child: Checkbox(
                          //       value: checkbox1,
                          //       activeColor: Colors.orange,
                          //       onChanged: (value) {
                          //         //value may be true or false
                          //         setState(() {
                          //           checkbox1 = !checkbox1;
                          //         });
                          //       },
                          //     ),
                          //   ),
                          //   SizedBox(width: 10.0),
                          //   Text('Payment method')
                          // ]),
                          SizedBox(height: 10.0),
                          //Text('Date Picker'),
                          SizedBox(height: 10.0),
                          InkWell(
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1994),
                                lastDate: DateTime(2101),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.dark(),
                                    child: child!,
                                  );
                                },
                              );
                              if (picked != null && picked != date)
                                setState(() {
                                  date = picked;
                                });
                            },
                            child: Text('Choose payment date:   $date'),
                          ),
                          SizedBox(height: 10.0),

                          //TODO ADD FIELD ATTACHMENT HERE
                          //FilePickerDemo(),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [                                
                                RaisedButton(
                                  color: Colors.green,
                                  child: Text('Submit',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    //Do Something
                                  },
                                ),
                                MaterialButton(
                                  color: Colors.orange,
                                  child: Text('Cancel',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    //Do Something
                                  },
                                ),
                              ])
                        ]))
              ],
            )),
      ),
    );
  }
}
