import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '/dashboard/applications/application_overview.dart';
import '/widgets/centered_view/centered_view.dart';
import '/widgets/navigation_drawer/draweritem_home.dart';

class AppFormPage extends StatelessWidget {
  AppFormPage({Key key}) : super(key: key);
//   @override
//   AppFormPageState createState() => AppFormPageState();
// }

// class AppFormPageState extends State<AppFormPage> {
  final formKey = GlobalKey<FormBuilderState>();
  var selectedDun;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.Desktop
              ? TextAlign.left
              : TextAlign.center;
      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 20
              : 30;

      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 10
              : 16;

      return Container(
          width: 800,
          child: SingleChildScrollView(
              child: CenteredView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 40, top: 40, bottom: 40),
                  alignment: Alignment.topLeft,
                  child: Text("New Credit Application",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                FormBuilder(
                  key: formKey,
                  child: SingleChildScrollView(
                      
                      child: Column(
                        children: <Widget>[
                         Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "(A) Applicant and Spouse",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          FormBuilderRadioGroup(
                            name: "parliament",
                            initialValue: ["Klang"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.pin_drop_rounded),
                                labelText: "Parliament",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            options: [
                              //collect db

                              //     FirebaseFirestore.instance.collection('duns').snapshot.data.documents.map((DocumentSnapshot document) {
                              //   return DropdownMenuItem<String>(
                              //     value: document.data['name']),
                              //   );
                              // }).toList(),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          // StreamBuilder<QuerySnapshot>(
                          //     stream: FirebaseFirestore.instance
                          //         .collection("duns")
                          //         .snapshots(),
                          //     builder: (context, snapshot) {
                          //       if (!snapshot.hasData)
                          //         const Text("Loading.....");
                          //       else {
                          //         List<DropdownMenuItem> dunItems = [];
                          //         for (int i = 0;
                          //             i < snapshot.data.docs.length;
                          //             i++) {
                          //           DocumentSnapshot snap =
                          //               snapshot.data.docs[i];
                          //           dunItems.add(
                          //             DropdownMenuItem(
                          //               child: Text(
                          //                 snap.id,
                          //                 style: TextStyle(
                          //                     color: Color(0xff11b719)),
                          //               ),
                          //               value: "${snap.id}",
                          //             ),
                          //           );
                          //         }

                          FormBuilderDropdown(
                              name: "dun",
                              //initialValue: dun,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.pin_drop_rounded),
                                  labelText: "Dun",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              items: []
                              // dunItems
                              //     .map((data) => DropdownMenuItem(
                              //         value: data,
                              //         child: Text(data.child.toString())))
                              //     .toList(),

                              // DropdownMenuItem(
                              //   value: duns,
                              // child: FormBuilderCheckbox(decoration: InputDecoration(options:[],),),
                              // )
                              //collect fs
                              //],
                              ),

                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "applicant_name",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Enter your name",
                                labelText: "Applicant Name",
                                fillColor: Colors.red[100],
                            ),
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "applicant_ic",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.minLength(context, 10),
                              FormBuilderValidators.maxLength(context, 12)
                            ]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.card_membership),
                                hintText:
                                    "Enter your Identification Card number",
                                labelText: "Applicant IC Number"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "applicant_address",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.location_pin),
                                hintText: "Enter your address",
                                labelText: "Address"),
                          ),
                          /*SizedBox(height: 25),
                  FormBuilderTextField(
                    name: "postcode",
                    validators: [FormBuilderValidators.required(), FormBuilderValidators.numeric()],
                    decoration: InputDecoration(
                        icon: Icon(Icons.location_city),
                        hintText: "Enter your postcode",
                        labelText: "Postcode"
                    ),
                  ),
                  SizedBox(height: 25),
                  //FIRESTORE daerah HERE
                  FormBuilderTextField(
                    name: "email",
                    validators: [FormBuilderValidators.required(), FormBuilderValidators.email()],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: "Enter your email",
                        labelText: "Email"
                    ),
                  ),*/
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "applicant_mobile",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context)
                            ]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone_android),
                                hintText: "Enter your mobile no",
                                labelText: "Mobile No"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "applicant_home",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.numeric(context)]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone),
                                hintText: "Enter your home no",
                                labelText: "Home No"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "applicant_gender",
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.emoji_people),
                                labelText: "Gender",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Male"),
                              FormBuilderFieldOption(value: "Female"),
                            ],
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "applicant_religion",
                            initialValue: ["Islam"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.privacy_tip),
                                labelText: "Religion",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Islam"),
                              FormBuilderFieldOption(value: "Kristian"),
                              FormBuilderFieldOption(value: "Buddha"),
                              FormBuilderFieldOption(value: "Hindu"),
                              FormBuilderFieldOption(value: "Sikh")
                            ],
                          ),
                          //BANGSA
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "applicant_race",
                            initialValue: ["Malay"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.people),
                                labelText: "Race",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Malay"),
                              FormBuilderFieldOption(value: "Indian"),
                              FormBuilderFieldOption(value: "Chinese"),
                              FormBuilderFieldOption(value: "Native Sabah"),
                              FormBuilderFieldOption(value: "Native Sarawak"),
                              FormBuilderFieldOption(
                                  value: "Native (Peninsula)"),
                              FormBuilderFieldOption(value: "Non-citizen"),
                            ],
                          ),
                          //MARITAL STATUS
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "applicant_marital",
                            initialValue: ["Single"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.family_restroom),
                                labelText: "Marital Status",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: ['Single', 'Married', 'Divorced']
                                .map((lang) =>
                                    FormBuilderFieldOption(value: lang))
                                .toList(growable: false),
                          ),
                          //RESIDENCY PERIOD
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "applicant_residency",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context)
                            ]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.location_city),
                                hintText: "Enter your residency period",
                                labelText: "Residency Period"),
                          ),
                          SizedBox(height: 25),

                          //SPOUSE
                          FormBuilderTextField(
                            name: "spouse_name",
                            decoration: InputDecoration(
                                icon:
                                    Icon(Icons.supervised_user_circle_rounded),
                                hintText: "Enter your spouse name",
                                labelText: "Spouse Name"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "spouse_ic",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context),
                              FormBuilderValidators.minLength(context, 10),
                              FormBuilderValidators.maxLength(context, 12)
                            ]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.card_membership),
                                hintText:
                                    "Enter your spouse Identification Card number",
                                labelText: "Spouse IC Number"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "spouse_mobile",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context)
                            ]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone_android),
                                hintText: "Enter your spouse mobile no",
                                labelText: "Mobile No"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "spouse_religion",
                            initialValue: ["Islam"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.privacy_tip),
                                labelText: "Religion",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Islam"),
                              FormBuilderFieldOption(value: "Kristian"),
                              FormBuilderFieldOption(value: "Buddha"),
                              FormBuilderFieldOption(value: "Hindu"),
                              FormBuilderFieldOption(value: "Sikh")
                            ],
                          ),
                          //BANGSA
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "spouse_race",
                            initialValue: ["Malay"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.people),
                                labelText: "Race",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Malay"),
                              FormBuilderFieldOption(value: "Indian"),
                              FormBuilderFieldOption(value: "Chinese"),
                              FormBuilderFieldOption(value: "Native Sabah"),
                              FormBuilderFieldOption(value: "Native Sarawak"),
                              FormBuilderFieldOption(
                                  value: "Native (Peninsula)"),
                              FormBuilderFieldOption(value: "Non-citizen"),
                            ],
                          ),
                          SizedBox(height: 25),
                        ]
                      ))),
                      
                          // SECTION C
                          Card(
                    elevation: 20,
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "(C) Business Activities",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          FormBuilderTextField(
                            name: "work_type",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.work),
                                hintText: "Enter your business type",
                                labelText: "Business Type"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "work_period",
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.business_outlined),
                                labelText: "Business Period (Years)",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "1-3"),
                              FormBuilderFieldOption(value: "3-5"),
                              FormBuilderFieldOption(value: "5-7"),
                              FormBuilderFieldOption(value: "7-10"),
                              FormBuilderFieldOption(value: "More than 10"),
                            ],
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "work_address",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.location_pin),
                                hintText: "Enter your business location",
                                labelText: "Work Address"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "work_license",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.work),
                                hintText:
                                    "Enter your business license (SSM/PBT)",
                                labelText: "Business License"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "premise",
                            initialValue: ["Permenant"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.business_outlined),
                                labelText: "Premise",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Permenant"),
                              FormBuilderFieldOption(value: "Temporary"),
                            ],
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "ownership",
                            //initialValue: ["Permenant"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.person_pin_circle_rounded),
                                labelText: "Business Ownership",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Rental"),
                              FormBuilderFieldOption(value: "Private"),
                            ],
                          ),
                          SizedBox(height: 25),
                        ]))),

                          // SECTION D                          
                          Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "(D) Loan Purpose",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          FormBuilderRadioGroup(
                            name: "scheme",
                            //initialValue: ["Permenant"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.local_atm_rounded),
                                labelText: "Scheme",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Go Digital"),
                              FormBuilderFieldOption(value: "Microcredit"),
                              FormBuilderFieldOption(value: "NaDi"),
                              FormBuilderFieldOption(value: "Sitham"),
                              FormBuilderFieldOption(value: "Zero To Hero"),
                            ],
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "requested_amt",
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.money_outlined),
                                hintText: "Enter your requested amount (RM)",
                                labelText: "Requested Amount"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "payback_period",
                            //initialValue: ["Permenant"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.access_time),
                                labelText: "Payback Period (Week)",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "25"),
                              FormBuilderFieldOption(value: "50"),
                              FormBuilderFieldOption(value: "100"),
                              FormBuilderFieldOption(value: "150"),
                            ],
                          ),
                          SizedBox(height: 25),
                          FormBuilderRadioGroup(
                            name: "purpose",
                            //initialValue: ["Permenant"],
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.question_answer),
                                labelText: "Loan Purpose",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            options: [
                              FormBuilderFieldOption(value: "Additional modal"),
                              FormBuilderFieldOption(value: "Premise repair"),
                              FormBuilderFieldOption(
                                  value: "Tools and utilities"),
                              // otherss !!!
                            ],
                          ),
                          SizedBox(height: 25),
                        ]))),
                          
                          // SECTION E-G
                           Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "(E) Income and Expenses",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          FormBuilderTextField(
                            name: "total_income",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context),
                            ]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.request_quote_sharp),
                                hintText: "Total Income",
                                labelText: "Monthly Income (RM)"),
                          ),
                          SizedBox(height: 25),
                          FormBuilderTextField(
                            name: "total_expenses",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context),
                            ]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.food_bank_outlined),
                                hintText: "Total Expenses",
                                labelText: "Monthly Expenses (RM)"),
                          ),
                          SizedBox(height: 25),
                        ]))),
                          // AUTO CALCULATE GROSS!!!!!!

                          /*FormBuilderDateTimePicker(
                    name: "date",
                    inputType: InputType.date,
                    format: DateFormat("dd-MM-yyyy"),
                    decoration: InputDecoration(labelText: "Date of Birth"),
                    validators: [FormBuilderValidators.required()],
                  ),
                  SizedBox(height: 25),
                  FormBuilderTextField(
                    name: "age",
                    decoration: InputDecoration(labelText: "Age"),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validators: [
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  SizedBox(height: 25),
                  SizedBox(height: 25),
                  FormBuilderCountryPicker(
                    name: "country",
                    initialValue: "United States",
                    decoration: InputDecoration(
                        labelText: "Country",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                    ),
                  ),
                  SizedBox(height: 25),
                  FormBuilderTextField(
                    name: "password",
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    maxLines: 1,
                    maxLength: 16,
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                      FormBuilderValidators.maxLength(16)],
                  ),*/
                          SizedBox(height: 40),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  icon: Icon(Icons.book),
                                  label: Text("Submit"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(20)),
                                  ),
                                  onPressed: () {
                                    formKey.currentState.save();
                                    if (formKey.currentState.validate()) {
                                      //print(formKey.currentState.value);
                                      FirebaseFirestore.instance
                                          .collection('applications')
                                          .doc()
                                          .set({
                                        /*'parliament': formKey.currentState
                                                .value['parliament'],
                                            'dun': formKey
                                                .currentState.value['dun'],*/
                                        'applicant_name': formKey.currentState
                                            .value['applicant_name'],
                                        //'email': formKey.currentState.value['email'], //maybe change to userID
                                        'applicant_ic': formKey
                                            .currentState.value['applicant_ic'],
                                        'applicant_address': formKey
                                            .currentState
                                            .value['applicant_address'],
                                        //'postcode': formKey.currentState.value['postcode'],
                                        'applicant_mobile': formKey.currentState
                                            .value['applicant_mobile'],
                                        'applicant_home': formKey.currentState
                                            .value['applicant_home'],
                                        'applicant_gender': formKey.currentState
                                            .value['applicant_gender'],
                                        'applicant_religion': formKey
                                            .currentState
                                            .value['applicant_religion'],
                                        'applicant_race': formKey.currentState
                                            .value['applicant_race'],
                                        'applicant_marital': formKey
                                            .currentState
                                            .value['applicant_marital'],
                                        'applicant_residency': formKey
                                            .currentState
                                            .value['applicant_residency'],

                                        'spouse_name': formKey
                                            .currentState.value['spouse_name'],
                                        'spouse_ic': formKey
                                            .currentState.value['spouse_ic'],
                                        'spouse_mobile': formKey.currentState
                                            .value['spouse_mobile'],
                                        'spouse_religion': formKey.currentState
                                            .value['spouse_religion'],
                                        'spouse_race': formKey
                                            .currentState.value['spouse_race'],

                                        'work_address': formKey
                                            .currentState.value['work_address'],
                                        'premise': formKey
                                            .currentState.value['premise'],
                                        'ownership': formKey
                                            .currentState.value['ownership'],
                                        'scheme': formKey
                                            .currentState.value['scheme'],
                                        'requested_amt': formKey.currentState
                                            .value['requested_amt'],
                                        'payback_period': formKey.currentState
                                            .value['payback_period'],
                                        'purpose': formKey
                                            .currentState.value['purpose'],
                                        'total_income': formKey
                                            .currentState.value['total_income'],
                                        'total_expenses': formKey.currentState
                                            .value['total_expenses'],
                                      });
                                    }
                                  },
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                ElevatedButton.icon(
                                  icon: Icon(Icons.cancel_outlined),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
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
                                    formKey.currentState.reset();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ApplicationScreen()));
                                  },
                                ),
                              ]),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  )]),
                ),
              ));
    });
  }
}
