import 'package:flutter/material.dart';
import 'package:flutter_store/components/custom_form.dart';
import 'package:flutter_store/components/logo.dart';
import 'package:flutter_store/components/size.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: xlarge_gap),
          Logo("Login"),
          SizedBox(height: large_gap),
          CustomForm(),
        ],
      ),
    ));
  }
}
