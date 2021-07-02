import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppDetailsPage extends StatefulWidget {
  final DocumentSnapshot app;

  AppDetailsPage({this.app});

  @override
  _AppDetailsPageState createState() => _AppDetailsPageState();
}

class _AppDetailsPageState extends State<AppDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        //ATTENTION: NEED TO REUSE
        //home: new RootPage(auth:new Auth())

        // appBar: AppBar(
        //   title: const Text("Credit Application"),
        //   centerTitle: true,
        //   backgroundColor: Colors.black,
        // ),
        
      padding: const EdgeInsets.all(60),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text('Borrower'),
                              // PageViewCardListTile(
                              //   title: 'Parliament',
                              //   content: widget.app.data()['parliament'].toString() ?? '',
                              //   //: true,
                              // ),
                              // PageViewCardListTile(
                              //   title: 'Dun',
                              //   content: widget.app.data()['dun'].toString() ?? '',
                              // ),
                              PageViewCardListTile(
                                title: 'Name',
                                content: widget.app.data()['applicant_name'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Identification Number',
                                content: widget.app.data()['applicant_ic'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Address',
                                content: widget.app.data()['applicant_address'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Phone Number',
                                content: widget.app.data()['applicant_mobile'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Home Number',
                                content: widget.app.data()['applicant_home'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Gender',
                                content: widget.app.data()['applicant_gender'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Religion',
                                content: widget.app.data()['applicant_religion'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Race',
                                content: widget.app.data()['applicant_race'].toString() ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Marital Status',
                                content: widget.app.data()['applicant_marital'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Residency Period',
                                content: widget.app.data()['applicant_residency'] ?? '',
                              ),
                              
                              //SPOUSE
                              //Text('Spouse'),
                              PageViewCardListTile(
                                title: 'Name',
                                content: widget.app.data()['spouse_name'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Identification Number',
                                content: widget.app.data()['spouse_ic'] ?? '',
                              ),                              
                              PageViewCardListTile(
                                title: 'Phone Number',
                                content: widget.app.data()['spouse_mobile'] ?? '',
                              ),
                               PageViewCardListTile(
                                title: 'Religion',
                                content: widget.app.data()['spouse_religion'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Race',
                                content: widget.app.data()['spouse_race'].toString() ?? '',
                              ),

                              //Text('Business'),
                              PageViewCardListTile(
                                title: 'Address',
                                content: widget.app.data()['work_address'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Premise',
                                content: widget.app.data()['premise'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Ownership',
                                content: widget.app.data()['ownership'] ?? '',
                                //biggerContent: true,
                              ),

                              //Text('Loan'),
                              PageViewCardListTile(
                                title: 'Status',
                                content: widget.app.data()['appStatus'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Scheme',
                                content: widget.app.data()['scheme'] ?? '',
                              ),                              
                              PageViewCardListTile(
                                title: 'Payback period',
                                content: widget.app.data()['payback_period'] + ' weeks' ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Purpose',
                                content: widget.app.data()['purpose'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Requested Loan Amount',
                                content: 'RM' + widget.app.data()['requested_amt'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Total Income',
                                content: 'RM' + widget.app.data()['total_income'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Total Expenses',
                                content: 'RM' + widget.app.data()['total_expenses'] ?? '',
                              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageViewCardListTile extends StatelessWidget {
  final String title;
  final String content;
  final bool biggerContent;

  PageViewCardListTile({
    @required this.title,
    @required this.content,
    this.biggerContent = false,
  })  : assert(title != null),
        assert(content != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.caption, 
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          content,
          style: biggerContent
              ? Theme.of(context).textTheme.subtitle1
              : Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
