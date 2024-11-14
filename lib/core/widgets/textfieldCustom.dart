import 'package:flutter/material.dart';

class idTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  idTextField({super.key, required this.controller, required this.label});

  RegExp idValidator = RegExp(r'^[0-9]$');
//[0:9]
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        final reg = idValidator;
        if (value!.isEmpty) {
          return 'Enter Your ID';
        } else if (!reg.hasMatch(value)) {
          return 'Number Between 0:9';
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter Your Personal ID 0:9 ',
        hintStyle: TextStyle(color: Colors.grey),
        label: Text( label,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        prefixIcon: Icon(Icons.local_police),
        prefixIconColor: Colors.black,
        filled: true,
        fillColor: Colors.cyan[50],
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class textFieldCustomed extends StatelessWidget {
  final String Label;
  final TextEditingController Controller;
  final  Icon icon;

  textFieldCustomed({super.key, required this.Label, required this.Controller, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: Controller,
      validator: (value) {
        if (value!.isEmpty || value! == null) {
          return 'Enter Correct Syntax';
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter Text',
        hintStyle: TextStyle(color: Colors.grey),
        label: Text(
          Label,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        prefixIcon: icon,
        prefixIconColor: Colors.black,
        filled: true,
        fillColor: Colors.cyan[50],
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController Controller;
  const PasswordTextField({super.key, required this.Controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  TextEditingController passwordController = TextEditingController();
  bool isvisibile = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter a Valid Password';
          }
          if (value.length < 8) {
            return 'Invalid Password';
          }
        },
        obscureText: !isvisibile,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.cyan[50],
            filled: true,
            hintText: 'Enter Password',
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
            prefixIcon: Icon(Icons.key),
            prefixIconColor: Colors.black,
            suffixIconColor: Colors.black,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isvisibile = !isvisibile;
                  });
                },
                iconSize: 23,
                icon: Icon(isvisibile
                    ? Icons.visibility
                    : Icons.visibility_off_outlined))));
  }
}

