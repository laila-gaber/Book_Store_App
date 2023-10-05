import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_clinic/core/Colors.dart';
import 'package:v_care_clinic/core/SharedFunctions.dart';
import 'package:v_care_clinic/screens/Profile_screen/view/User_Profile_Screen.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/edit_profile/edit_profile_cubit.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/show_profile/show_profile_cubit.dart';

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
            navto(context, UserProfileScreen());
          }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Update details!',
                      style: TextStyle(
                          fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Update your info and become a new you!',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0XFF030E19),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        else if (nameController.text.length < 3) {
                          return 'name must be more than 3 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        else if (!value.contains('@')) {
                          return 'Please enter your valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        }
                        else if (value.length < 11) {
                          return 'Please enter your valid phone number';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: CityController,
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your city ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'City',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: AdressController,
                      keyboardType: TextInputType.streetAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your adress ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Adress',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
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
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: const Size(312, 48),
                      ),
                      child: Text(
                        'UPDATE',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ); //: CircularProgressIndicator();

  }
}
