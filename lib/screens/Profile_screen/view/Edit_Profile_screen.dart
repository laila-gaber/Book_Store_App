import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_clinic/core/app_colors.dart';
import 'package:v_care_clinic/core/component.dart';
import 'package:v_care_clinic/core/font.dart';
import 'package:v_care_clinic/core/shared_functions.dart';
import 'package:v_care_clinic/screens/Profile_screen/view/User_Profile_Screen.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/edit_profile/edit_profile_cubit.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/show_profile/show_profile_cubit.dart';

import '../../nav/navbar.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  bool isvisible = false;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var CityController = TextEditingController();
  var AdressController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is EditProfileSuccess)
          {
            ShowProfileCubit.get(context).GetProfileData();
            Navigator.pop(context);
          }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: secondaryColor,
          appBar: AppBar(
            backgroundColor: mainColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Column(
                children: [
                  Text(
                    'Update details!',
                    style: Styles.HEADERSTEXTSTYLE1
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Update your info and become a new you!',
                    style: Styles.SUBHEADERSTEXTSTYLE,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            else if (nameController.text.length < 3) {
                              return 'name must be more than 3 characters';
                            }
                            return null;
                          },
                          label_text: 'Name',
                        ),
                        SizedBox(height: 20),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            else if (!value.contains('@')) {
                              return 'Please enter your valid email';
                            }
                            return null;
                          },
                          label_text: 'Email',
                        ),
                        SizedBox(height: 20),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone';
                            }
                            else if (value.length < 11) {
                              return 'Please enter your valid phone number';
                            }
                          },
                          label_text: 'Phone',
                        ),
                        SizedBox(height: 20),
                        defaultFormField(
                          controller: CityController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your city ';
                            }
                            return null;
                          },
                          label_text: 'City',
                        ),
                        SizedBox(height: 20),
                        defaultFormField(controller: AdressController,
                            type: TextInputType.streetAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your adress ';
                              }
                              return null;
                            },
                            label_text: 'Adress'
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  customElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          isvisible = true;
                          EditProfileCubit.get(context).editprofile(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            city: CityController.text,
                            address: AdressController.text,
                          );
                        }
                      },
                      text: 'UPDATE'
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ); //: CustomLoadingIndicator();

  }
}
