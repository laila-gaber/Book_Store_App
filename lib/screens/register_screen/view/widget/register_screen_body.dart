import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v_care_clinic/core/Colors.dart';
import 'package:v_care_clinic/core/SharedFunctions.dart';
import 'package:v_care_clinic/screens/Home_screen/view/home_screen.dart';
import 'package:v_care_clinic/screens/LoginScreen/view/SignInScreen.dart';
import 'package:v_care_clinic/screens/OTP_screen/view/OTPScreen.dart';
import 'package:v_care_clinic/screens/nav/navbar.dart';
import '../../../../core/cache_helper.dart';
import '../../../../core/component.dart';

import '../../view_model/cubit/cubit.dart';
import '../../view_model/cubit/states.dart';

class RegisterScreenBody extends StatefulWidget {
  RegisterScreenBody({Key? key}) : super(key: key);

  @override
  _RegisterScreenBodyState createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  bool isvisible = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String selectedGender = '1';

  Future<void> storeTokenInSharedPreferences(String token) async {
    CacheHelper.saveData(key: "token", value: token);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (BuildContext context, RegisterStates state) {
        if(state is RegisterSuccessState){
          navto(context,Nav());
        }

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("#174068"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Let’s get started!',
                      style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Create an account and start booking now.',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: HexColor('#7C808A'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        else if(nameController.text.length<3){
                          return 'name must be more than 3 characters';
                        }
                        return null;
                      },
                      label: 'Name',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        else if(!value.contains('@')){
                          return 'Please enter your valid email';
                        }
                        return null;
                      },
                      label: 'Email',
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(height: 20.h),
                    defaultFormField(

                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      label: 'Password',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password again';
                        }
                        else if(passwordController.text!=confirmPasswordController.text){
                          return 'confirm password doesn\'t match password';
                        }

                        return null;
                      },
                      label: 'Confirm Password',
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text('Already have an account?', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5,),
                       TextButton(

                         onPressed: (){
                           navto(context, SignInScreen());
                         },
                         child:const Text(
                           'Login here',
                         ) ,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          isvisible = true;
                          RegisterCubit.get(context).addRegister(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            ConfirmPassword: confirmPasswordController.text,
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: const Size(312, 48),
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
