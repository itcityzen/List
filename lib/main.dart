import 'package:database_task/core/sharedPreference/SharedPreference.dart';
import 'package:database_task/core/splashScreen/splashAnimated.dart';
import 'package:database_task/feature/home.dart';
import 'package:database_task/feature/registeration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceShow.StartPreference();
  await checkLogin();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogged? homePage():splashAnimatedScreen() ,
    );
  }
}

bool isLogged = false;
Future checkLogin() async {
  bool? isLogin = await SharedPreferenceShow.getLogin();
  if (isLogin != null) {
    isLogged = true;
  }else{isLogged = false;}
}

late int? UsernameID ;