import 'package:database_task/core/database/database.dart';
import 'package:database_task/core/sharedPreference/SharedPreference.dart';
import 'package:database_task/core/widgets/textfieldCustom.dart';
import 'package:database_task/feature/home.dart';
import 'package:database_task/feature/registeration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registerationSign extends StatelessWidget {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DatabaseShow db1 = DatabaseShow();

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
                                color: Colors.cyan[50]))
                      ])),
                      SizedBox(
                        height: 50,
                      ),
                      textFieldCustomed(
                        Label: 'Email',
                        Controller: usernameController,
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
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            int? UserID = await db1.ForRegisterUser(
                                {'username': usernameController.text});

                            if (UserID != null) {
                              await SharedPreferenceShow.setLogin(true);
                              await SharedPreferenceShow.setUsername(
                                  usernameController.text);
                              await SharedPreferenceShow.setUserId(UserID);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homePage(
                                            UserId: UserID,
                                          )));
                            } else {
                              print('Username is already existed');
                            }
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
