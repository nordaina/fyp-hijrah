import 'storage_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 't3_approval.dart';

class AppDetails extends StatefulWidget {
  final DocumentSnapshot app;

  AppDetails({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  _AppDetailsState createState() => _AppDetailsState();
}

class _AppDetailsState extends State<AppDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  bool isEnabled = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollController = ScrollController();
    _checkStatus();
  }

  @override
  void dispose() {
    // "Unmount" the controllers:
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _checkStatus() {
    setState(() {
      if (widget.app['appStatus'] == 'Completed') isEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.orangeAccent,
              //expandedHeight: 340.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: "Review"),
                  Tab(text: "Credit Scoring"),
                  Tab(text: "Approval"),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              // Text('Borrower'),
                              // PageViewCardListTile(
                              //   title: 'Parliament',
                              //   content: widget.app['parliament'].toString(),
                              //   //: true,
                              // ),
                              // PageViewCardListTile(
                              //   title: 'Dun',
                              //   content: widget.app['dun'].toString(),
                              // ),
                              PageViewCardListTile(
                                title: 'Name',
                                content: widget.app['applicant_name'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Identification Number',
                                content: widget.app['applicant_ic'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Address',
                                content: widget.app['applicant_address'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Phone Number',
                                content: widget.app['applicant_mobile'] ?? '',
                              ),
                              // PageViewCardListTile(
                              //   title: 'Home Number',
                              //   content: widget.app['applicant_home'] ?? '',
                              // ),
                              PageViewCardListTile(
                                title: 'Gender',
                                content: widget.app['applicant_gender'] ?? '',
                              ),
                              // PageViewCardListTile(
                              //   title: 'Religion',
                              //   content: widget.app['applicant_religion'] ?? '',
                              // ),
                              // PageViewCardListTile(
                              //   title: 'Race',
                              //   content: widget.app['applicant_race'].toString(),
                              // ),
                              PageViewCardListTile(
                                title: 'Marital Status',
                                content: widget.app['applicant_marital'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Residency Period',
                                content: widget.app['applicant_residency'] ?? '',
                              ),
                              
                              //SPOUSE
                              //Text('Spouse'),
                              PageViewCardListTile(
                                title: 'Name',
                                content: widget.app['spouse_name'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Identification Number',
                                content: widget.app['spouse_ic'] ?? '',
                              ),                              
                              PageViewCardListTile(
                                title: 'Phone Number',
                                content: widget.app['spouse_mobile'] ?? '',
                              ),
                               PageViewCardListTile(
                                title: 'Religion',
                                content: widget.app['spouse_religion'] ?? '',
                              ),
                              // PageViewCardListTile(
                              //   title: 'Race',
                              //   content: widget.app['spouse_race'].toString(),
                              // ),

                              //Text('Business'),
                              PageViewCardListTile(
                                title: 'Address',
                                content: widget.app['work_address'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Premise',
                                content: widget.app['premise'] ?? '',
                                //biggerContent: true,
                              ),
                              PageViewCardListTile(
                                title: 'Ownership',
                                content: widget.app['ownership'] ?? '',
                                //biggerContent: true,
                              ),

                              //Text('Loan'),
                              // PageViewCardListTile(
                              //   title: 'Status',
                              //   content: widget.app['appStatus'] ?? '',
                              // ),
                              PageViewCardListTile(
                                title: 'Scheme',
                                content: widget.app['scheme'] ?? '',
                              ),                              
                              PageViewCardListTile(
                                title: 'Payback period',
                                content: widget.app['payback_period'] + ' weeks' ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Purpose',
                                content: widget.app['purpose'] ?? '',
                              ),
                              PageViewCardListTile(
                                title: 'Requested Loan Amount',
                                content: 'RM' + widget.app['requested_amt'],
                              ),
                              PageViewCardListTile(
                                title: 'Total Income',
                                content: 'RM' + widget.app['total_income'],
                              ),
                              PageViewCardListTile(
                                title: 'Total Expenses',
                                content: 'RM' + widget.app['total_expenses'],
                              ),
                            ])))),
            StarageDetails(),
            ApplicationApproval(),
          ],
          controller: _tabController,
        ),
      ),
      //ATTENTION: NEED TO REUSE
      //home: new RootPage(auth:new Auth())

      // appBar: AppBar(
      //   title: const Text("Credit Application"),
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      // ),

      /* SizedBox(
                child: ButtonBar(
                  buttonMinWidth: 100.0,
                  buttonHeight: 50.0,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new RaisedButton(
                      child: Text("Approve"),
                      textColor: Colors.white,
                      onPressed: () {
                        isEnabled
                            ? null
                            : widget.l.reference
                                .update({'appStatus': "Completed"});
                        Navigator.pop(context);
                      },
                      color: Colors.green,
                    ),
                    new RaisedButton(
                      child: Text("Reject"),
                      textColor: Colors.white,
                      onPressed: () {
                        widget.l.reference.update({'appStatus': "Rejected"});
                        Navigator.pop(context);
                      },
                      color: Colors.red,
                    ),
                  ],
                ),
              ),*/
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class PageViewCardListTile extends StatelessWidget {
  final String title;
  final String content;
  final bool biggerContent;

  PageViewCardListTile({
    required this.title,
    required this.content,
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
