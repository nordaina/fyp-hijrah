import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ApplicationApproval extends StatefulWidget {
  @override
  _ApplicationApprovalState createState() => _ApplicationApprovalState();
}

class _ApplicationApprovalState extends State<ApplicationApproval> {
  final approvalFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(60),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                        padding: const EdgeInsets.all(40.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          Container(
           // padding: EdgeInsets.only(left: 40, top: 40),
            alignment: Alignment.topLeft,
            child: Text("Application Approval",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          SafeArea(
              child: FormBuilder(
                  key: approvalFormKey,
                  child: SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(children: <Widget>[
                            FormBuilderRadioGroup(
                              name: "status1",
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.looks_one_outlined),
                                  border: InputBorder.none,
                                  labelText: "Branch approval",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              options: [
                                FormBuilderFieldOption(value: "Approve"),
                                FormBuilderFieldOption(value: "Reject"),
                              ],
                            ),
                            SizedBox(height: 25),
                            FormBuilderRadioGroup(
                              name: "status2",
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.looks_two_outlined),
                                  border: InputBorder.none,
                                  labelText: "Zone approval",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              options: [
                                FormBuilderFieldOption(value: "Approve"),
                                FormBuilderFieldOption(value: "Reject"),
                              ],
                            ),
                            SizedBox(height: 25),
                            FormBuilderRadioGroup(
                              name: "status3",
                              enabled: false,
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              decoration: InputDecoration(
                                enabled: false,
                                  icon: Icon(Icons.looks_3_outlined),
                                  border: InputBorder.none,
                                  labelText: "HQ approval",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              options: [
                                FormBuilderFieldOption(value: "Approve"),
                                FormBuilderFieldOption(value: "Reject"),
                              ],
                            ),
                            SizedBox(height: 25),
                            FormBuilderTextField(
                              name: "approved_amt",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context)
                              ]),
                              decoration: InputDecoration(
                                  icon: Icon(Icons.attach_money),
                                  hintText: "Approved amount",
                                  labelText: "Approved amount"),
                            ),
                            SizedBox(height: 25),
                            FormBuilderTextField(
                              name: "remarks",
                              decoration: InputDecoration(
                                  icon: Icon(Icons.comment_bank),
                                  hintText:
                                      "Insert comment/reason about the application (optional)",
                                  labelText: "Remarks"),
                            ),
                            SizedBox(height: 25),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                      icon: Icon(Icons.save),
                                      label: Text("Save"),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(20)),
                                      ),
                                      onPressed: () {
                                        approvalFormKey.currentState!.save();
                                        if (approvalFormKey.currentState!
                                            .validate()) {
                                          print(approvalFormKey
                                              .currentState!.value);
                                          FirebaseFirestore.instance
                                              .collection('applications')
                                              .doc()
                                              .set(
                                            {
                                              'status': approvalFormKey
                                                  .currentState!
                                                  .value['appStatus'],
                                              'remarks': approvalFormKey
                                                  .currentState!
                                                  .value['remarks'],
                                              'approved_amt': approvalFormKey
                                                  .currentState!
                                                  .value['approved_amt'],
                                            },
                                          );
                                        }
                                      }),
                                  Padding(padding: EdgeInsets.all(30)),
                                  ElevatedButton.icon(
                                      icon: Icon(Icons.cancel_outlined),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                        ),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(20)),
                                      ),
                                      label: Text("Cancel"),
                                      onPressed: () {
                                        approvalFormKey.currentState!.reset();
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> AppOverview()));
                                      })
                                ])
                          ])))))
        ])))
        )
    );
  }
}
