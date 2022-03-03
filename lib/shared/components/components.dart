
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';


Widget buildButton({
  context,
  double width = double.infinity,
  Color background = Colors.white,
  Color textcolor=Colors.black,
  bool isUpperCase = true,
  double radius = 0.0,
  required  Function() function,
  required String text,
  LinearGradient? gradient,
}) =>
    Container(
      width: width,
      height:MediaQuery.of(context).size.height * 0.13,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: GoogleFonts.openSans(fontSize: 26,color:textcolor ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
        gradient: gradient,
      ),
    );

