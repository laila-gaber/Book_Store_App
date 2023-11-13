import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_care_clinic/core/font.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/shared_functions.dart';
import '../../../../screens/nav/navbar.dart';
import '../../../../core/cache_helper.dart';
import '../../../../core/component.dart';

import '../../../Login_screen/view/SignInScreen.dart';
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
          backgroundColor: secondaryColor,
          appBar: customAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Let’s get started!',
                    style: Styles.HEADERSTEXTSTYLE1,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Create an account and start booking now.',
                    style: Styles.SUBHEADERSTEXTSTYLE,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [

                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.emailAddress,
                          label_text: 'Name',
                          hint_text: 'Enter your name here',
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            else if(nameController.text.length<3){
                              return 'name must be more than 3 characters';
                            }
                            return null;
                          },

                        ),
                        SizedBox(height: 20.h),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          hint_text: 'ex:lailaGaber@gmail.com',
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            else if(!value.contains('@')){
                              return 'Please enter your valid email';
                            }
                            return null;
                          },
                          label_text: 'Email',
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(height: 20.h),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          hint_text: 'secured password contains #,%..etc',
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          label_text: 'Password',
                        ),
                        SizedBox(height: 20.h),
                        defaultFormField(
                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          hint_text: 'Rewrite your password here',
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password again';
                            }
                            else if(passwordController.text!=confirmPasswordController.text){
                              return 'confirmed password doesn\'t match your password';
                            }
                            return null;
                          },
                          label_text: 'Confirm Password',
                        ),
                      ],
                    ),
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
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                            letterSpacing: 0.5,
                          ),
                        ) ,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  customElevatedButton(
                    text: 'Register',
                    onPressed:() {
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
