import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:v_care_clinic/core/app_colors.dart';


import '../Login_screen/view/SignInScreen.dart';
import '../register_screen/view/widget/register_screen_body.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController controller = PageController();
  int _totalDots = 3;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(int position) {
    setState(() => _currentPosition = _validPosition(position.toDouble()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: _updatePosition,
            children: [
              OnboardingScreen(
                  SizedBox(
                      child: Lottie.asset(
                        'assets/animations/Animation7.json'
                      )
                  ),
                  [
                    Text(
                      "\nWelcome to our book store application, where the world of literature is at your fingertips! \n",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ]
              ),
              OnboardingScreen(

              SizedBox(
              child: Lottie.asset(
                  'assets/animations/Animation8.json',
                fit: BoxFit.fill,
              )
              ),
                [
                Text(
                  "\nBrowse through an extensive collection of books and a diverse range of titles!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(padding: EdgeInsets.all(12.0)),
                SizedBox(
                  height: 20,
                ),
              ]
              ),
              OnboardingScreen(
                SizedBox(
                    child: Lottie.asset(
                        'assets/animations/Animation9.json',
                      fit: BoxFit.fill,
                    )
                ),
                [
                  Text(
                    "\nReady?\nLet's Explore new books!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      letterSpacing: 0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(12.0)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0.5,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(secondaryColor), // Set the background color to white
                          elevation: MaterialStateProperty.all(4), // Set the elevation to your desired value
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreenBody()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0.5,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(secondaryColor), // Set the background color to white
                          elevation: MaterialStateProperty.all(4), // Set the elevation to your desired value
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                decorator: DotsDecorator(
                  color: Colors.white,
                  activeColor: primaryColor,
                  activeSize:Size.fromRadius(7)
                ),
                dotsCount: 3,
                position: _currentPosition,
                onTap: (double page) {
                  setState(() {
                    controller.animateToPage(page.toInt(),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  });
                },
              ))
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final Widget? image;
  final List<Widget> text;

  const OnboardingScreen(this.image, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.tealAccent.shade100,
      child: Column(
        children: [
          if (image != null)
            Expanded(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shadowColor: primaryColor,
                    color: Colors.white,
                    elevation: 10,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: image!,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200)),
                  ),
                ),
              ),
              flex: 2,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: text),
            ),
            // flex: 1
          ),
        ],
      ),
    );
  }
}
