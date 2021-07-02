import 'package:flutter/material.dart';
import '../../constants.dart';
import 'database.dart';
import 'validator.dart';

import 'custom_form_field.dart';

class EditScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  EditScreen({
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _titleFocusNode = FocusNode();

  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseYellow,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: Text('Update announcement'),
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
              currentTitle: widget.currentTitle,
              currentDescription: widget.currentDescription,
            ),
          ),
        ),
      ),
    );
  }
}

class EditItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  const EditItemForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  });

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController(
      text: widget.currentTitle,
    );

    _descriptionController = TextEditingController(
      text: widget.currentDescription,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Form(
            key: _editItemFormKey,
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1200),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: 24.0),
                            Text(
                              'Title',
                              style: TextStyle(
                                color: CustomColors.firebaseGrey,
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
                              hint: 'Enter your note title',
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'Description',
                              style: TextStyle(
                                color: CustomColors.firebaseGrey,
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
                              hint: 'Enter your note description',
                            ),
                          ],
                        ),
                      ),
                      _isProcessing
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  CustomColors.firebaseOrange,
                                ),
                              ),
                            )
                          : Container(
                              width: 200,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    CustomColors.firebaseOrange,
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

                                  if (_editItemFormKey.currentState!
                                      .validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });

                                    await Database.updateItem(
                                      docId: widget.documentId,
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
                                  padding:
                                      EdgeInsets.all(10),
                                  child: Text(
                                    'Update',
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
