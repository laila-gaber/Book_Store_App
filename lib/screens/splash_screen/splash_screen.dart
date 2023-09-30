
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:v_care_clinic/core/Colors.dart';
import '../onboarding_screen/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
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
    return  Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 20),
        borderRadius: BorderRadius.circular(20),
        ),
        child:Column(
          children: [
            Spacer(flex: 3,),
            Image.asset(
                'assets/img/book_logo.jpg',
            ),
            Text(
              'Book Store',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            Spacer(flex: 3,),
          ],
        )
    );
  }
}
