import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/home/home.dart';
import 'router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        accentColor: Colors.yellow[800],
        textSelectionColor: Colors.yellow[100],
        cursorColor: Colors.yellow[800],
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: GoogleFonts.oswald(),
          subhead: GoogleFonts.lato(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(),
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
