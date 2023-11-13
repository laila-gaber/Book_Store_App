
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_clinic/core/font.dart';

import '../../../../core/app_colors.dart';
import 'package:v_care_clinic/core/shared_functions.dart';
import 'package:v_care_clinic/screens/Home_screen/view/home_screen.dart';
import 'package:v_care_clinic/screens/nav/navbar.dart';
import 'package:v_care_clinic/screens/register_screen/view/register_screen.dart';
import '../../../../core/component.dart';

import '../../../core/cache_helper.dart';
import '../viewmodel/SignIncubit/SignInStates.dart';
import '../viewmodel/SignIncubit/SigninCubit.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool _keepLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,);

    return BlocConsumer<SignInCubit,SignInStates>(
      listener: (BuildContext context, state) {
        if (state is SignInSuccessState  ) {
          print("SIGN in doneeeeeeee");
          navto(context,HomeScreen());

          print( state.signinmodel.message);
          print(CacheHelper.getData(key: "token"));
          navto(context, Nav());

        }
      },
    builder: (context,state) {
      return Scaffold(
        backgroundColor: secondaryColor,
        appBar: customAppBar(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(48.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style: Styles.HEADERSTEXTSTYLE1
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'sign in to explore the new books in the store!',
                    textAlign: TextAlign.center,
                    style: Styles.SUBHEADERSTEXTSTYLE,
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        defaultFormField(
                          controller: _emailController,
                          type: TextInputType.emailAddress,
                          label_text: 'Email',
                          hint_text: 'Enter your Email',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        defaultFormField(
                          controller: _passwordController,
                          type: TextInputType.visiblePassword,
                          label_text: 'Password',
                          hint_text: 'Enter your Password',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        activeColor: primaryColor,
                        //SignInCubit.get(context).isKeepmeLoginSelected,
                        onChanged: (bool? value) {
                          //SignUpCubit.get(context).changeKeepmeLoginSelection(value!);
                        },
                      ),
                      Text('Keep ME Log in'),


                    ],
                  ),

                  SizedBox(height: 20.h),


                  Row(
                    children: [
                      Text('Do not have an account yet?'),
                      TextButton(onPressed: () {
                        navto(context, RegisterScreen());
                      },
                        child: Text(
                          'sign up',
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  customElevatedButton(
                      text:'Log In',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SignInCubit.get(context).SignIn(_emailController.text, _passwordController.text);
                          // Perform login action here
                          // You can access the email and password using _emailController.text and _passwordController.text respectively
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        ),

      )
      ;
    }
    );
  }
}
