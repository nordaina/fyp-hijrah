import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddUser extends StatelessWidget {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Card(
              elevation: 5,
              child: FormBuilder(
                  key: formKey,
                  child: SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(children: <Widget>[
                            FormBuilderTextField(
                              name: 'email',
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                icon: Icon(Icons.email_outlined)
                                //errorText: _emailError,
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.email(context),
                              ]),
                            ),
                            SizedBox(height: 40),
                            FormBuilderTextField(
                              name: 'password',
                              decoration: InputDecoration(
                                labelText: 'Account password',
                                labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                icon: Icon(Icons.security_rounded)
                              ),
                              //onChanged: _onChanged, TODO
                              // valueTransformer: (text) => num.tryParse(text),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                                FormBuilderValidators.numeric(context),
                                FormBuilderValidators.min(context, 6),
                              ]),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 40),
                            FormBuilderDropdown(
                                name: "role",
                                //initialValue: dun,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.person),
                                    labelText: "Staff role",
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                items: [
                                  DropdownMenuItem(
                                      child: Text("Hijrah Officer (PH)"),
                                      value: "Hijrah Officer (PH)"),
                                  DropdownMenuItem(
                                      child:
                                          Text("Zone Approval Board (JKL Zon)"),
                                      value: "Zone Approval Board (JKL Zon)"),
                                  DropdownMenuItem(
                                      child: Text(
                                          "Branch Approval Board (JKL Cawangan)"),
                                      value: "Branch Approval Board (JKL Cawangan)"),
                                  DropdownMenuItem(
                                      child: Text("HQ Approval Board (JKL HQ)"),
                                      value: "HQ Approval Board (JKL HQ)"),
                                ]),
                                SizedBox(height: 40),
                                FormBuilderDropdown(
                                name: "branch",
                                //initialValue: dun,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.person),
                                    labelText: "Assigned branch",
                                    labelStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                items: [
                                  DropdownMenuItem(
                                      child: Text("Klang"),
                                      value: "Klang"),
                                  DropdownMenuItem(
                                      child:
                                          Text("Petaling Jaya"),
                                      value: "Petaling Jaya"),
                                  DropdownMenuItem(
                                      child: Text(
                                          "Kuala Selangor"),
                                      value: "Kuala Selangor"),
                                  DropdownMenuItem(
                                      child: Text("Hulu Selangor"),
                                      value: "Hulu Selangor"),
                                ]),
                            SizedBox(height: 40),
                            Row(children: <Widget>[
                              Expanded(
                                child: MaterialButton(
                                  color: Theme.of(context).accentColor,
                                  child: Text(
                                    "Assign",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    formKey.currentState!.save();
                                    if (formKey.currentState!.validate()) {
                                      FirebaseFirestore.instance
                                          .collection('staffs')
                                          .doc()
                                          .set({
                                        'email':
                                            formKey.currentState!.value['email'],
                                        'password': formKey
                                            .currentState!.value['password'],
                                        'role':
                                            formKey.currentState!.value['role'],
                                        'branch':
                                            formKey.currentState!.value['branch']
                                      });
                                    } else {
                                      print("registration failed");
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: MaterialButton(
                                  color: Theme.of(context).accentColor,
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    formKey.currentState!.reset();
                                  },
                                ),
                              ),
                            ])
                          ])))))
        ])))
    );
  }
}
