import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/core/services/service_locator.dart';
import 'package:note_app/core/utils/app_color.dart';
import 'package:note_app/presentation/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        appBarTheme: const AppBarTheme(
          color: mainColor
        ),
        floatingActionButtonTheme:const FloatingActionButtonThemeData(
          backgroundColor: mainColor
        ),
        primarySwatch:Colors.blue,
      ),
      home: const  NoteScreen()
    );
  }
}


