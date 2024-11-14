import 'package:database_task/core/widgets/textfieldCustom.dart';
import 'package:database_task/feature/home.dart';
import 'package:database_task/feature/registeration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registerationSign extends StatelessWidget {
  late int? UsernameID ;
  
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  registerationSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
        ),
        body: Form(
            key: globalKey,
            child: Stack(children: [
              Flexible(
                  child: Image.asset(
                'assets/istockphoto-1410976384-612x612.jpg',
                height: 1000,
                fit: BoxFit.fill,
              )),
              Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Register ',
                            style: GoogleFonts.almendraSc(
                                fontSize: 40,
                                color: Colors.black,
                                backgroundColor: Colors.cyanAccent[50])),
                        TextSpan(
                            text: 'Now',
                            style: TextStyle(
                                fontSize: 15,
                                backgroundColor: Colors.black,
                                color:Colors.cyan[50]   ))
                      ])),
                      SizedBox(
                        height: 50,
                      ),
                      textFieldCustomed(
                        Label: 'Email',
                        Controller: emailController,
                        icon: Icon(Icons.email),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      PasswordTextField(Controller: passwordController),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage(UsernameId: UsernameID,)));
                          }
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Colors.black, width: 1.5),
                            backgroundColor: Colors.cyan[50],
                            padding: EdgeInsets.symmetric(
                                vertical: 5.5, horizontal: 50)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Have Account ? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            registerationLogin()));
                              },
                              child: Text('Login '))
                        ],
                      )
                    ],
                  )),
            ])));
  }
}
