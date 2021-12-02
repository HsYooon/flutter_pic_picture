import 'package:flutter/material.dart';
import 'package:flutter_store/components/custom_text_form_field.dart';
import 'package:flutter_store/components/size.dart';

class CustomForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // form과 연결됨

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField("Email"),
          SizedBox(height: medium_gap),
          CustomTextFormField("Password"),
          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/main");
              }
            },
            child: Text("LOGIN"),
          ),
        ],
      ),
    );
  }
}
