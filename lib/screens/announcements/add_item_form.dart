import 'package:flutter/material.dart';
import '../../constants.dart';
import 'database.dart';
import 'validator.dart';

import 'custom_form_field.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;

  const AddItemForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Form(
            key: _addItemFormKey,
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1200),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 24.0),
                            Text(
                              'Title',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            CustomFormField(
                              isLabelEnabled: false,
                              controller: _titleController,
                              focusNode: widget.titleFocusNode,
                              keyboardType: TextInputType.text,
                              inputAction: TextInputAction.next,
                              validator: (value) => Validator.validateField(
                                value: value,
                              ),
                              label: 'Title',
                              hint: 'Insert announcement title',
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            CustomFormField(
                              maxLines: 10,
                              isLabelEnabled: false,
                              controller: _descriptionController,
                              focusNode: widget.descriptionFocusNode,
                              keyboardType: TextInputType.text,
                              inputAction: TextInputAction.done,
                              validator: (value) => Validator.validateField(
                                value: value,
                              ),
                              label: 'Description',
                              hint: 'Insert announcement description',
                            ),
                          ],
                        ),
                      ),
                      _isProcessing
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  CustomColors.firebaseAmber,
                                ),
                              ),
                            )
                          : Container(
                              width: 200,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    CustomColors.firebaseAmber,
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  widget.titleFocusNode.unfocus();
                                  widget.descriptionFocusNode.unfocus();

                                  if (_addItemFormKey.currentState!
                                      .validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });

                                    await Database.addItem(
                                      title: _titleController.text,
                                      description: _descriptionController.text,
                                    );

                                    setState(() {
                                      _isProcessing = false;
                                    });

                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Publish',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.firebaseGrey,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(height: 24.0),
                    ],
                  ),
                ))));
  }
}
