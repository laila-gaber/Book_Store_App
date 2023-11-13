import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_colors.dart';
abstract class Styles
{

  static const HEADERSTEXTSTYLE1 = TextStyle(
    color: primaryColor,
    fontFamily: 'Roboto',
    fontSize: 34,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    height: 1.17647,
    letterSpacing: 0.25,
  );
  static const HEADERSTEXTSTYLE2 = TextStyle(
    color: primaryColor,
    fontFamily: 'Roboto',
    fontSize: 34,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.17647,
    letterSpacing: 0.25,
  );
  static const SUBHEADERSTEXTSTYLE = TextStyle(
    color: thirdColor,
    fontFamily: 'Roboto',
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static const BUTTONTEXTSTYLE = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: Colors.white

  );
  static const BUTTONTEXTSTYLE2 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.black
  );
  static const INFORMFIELDSTYLE = TextStyle(
    color: Colors.black54,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

}
