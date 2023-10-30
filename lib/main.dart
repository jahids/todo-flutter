

import 'package:flutter/material.dart';
import 'package:flutter_todo/home_page.dart';
import 'package:flutter_todo/provider/todo_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: const Myapps()));
}

class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          textTheme: GoogleFonts.exo2TextTheme(),
        brightness: Brightness.dark
      ),
      home:  const MyHomePage(),
    );
  }
}


