
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:v_care_clinic/core/app_colors.dart';
import '../onboarding_screen/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    MyHome()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

       body:  Container(
           height: double.infinity,
           width: double.infinity,
           decoration: BoxDecoration(
             color: mainColor,
             border: Border.all(width: 20),
             borderRadius: BorderRadius.circular(20),
           ),
           child:Column(
             children: [
               Spacer(flex: 3,),
               SizedBox(
                   child: Lottie.asset('assets/animations/Animation6.json')
               ),
               /*Image.asset(
                 'assets/img/book_logo.jpg',
               ),*/
               Text(
                 'Book Store',
                 style: TextStyle(
                   fontSize: 35,
                   fontWeight: FontWeight.bold,
                   color: primaryColor,
                 ),
               ),
               Spacer(flex: 3,),
             ],
           )
       ),
    );
  }
}
