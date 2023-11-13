import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:v_care_clinic/core/component.dart';
import 'package:v_care_clinic/core/font.dart';
import 'package:v_care_clinic/core/shared_functions.dart';
import 'package:v_care_clinic/screens/Login_screen/view/SignInScreen.dart';
import 'package:v_care_clinic/screens/Profile_screen/view/Edit_Profile_screen.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/show_profile/show_profile_cubit.dart';

import '../../../core/app_colors.dart';
import '../../../core/shared_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowProfileCubit, ShowProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShowProfileCubit.get(context);
        if(state is LogoutSuccess)
        {

        }
        return cubit.showProfileModel != null
            ? Scaffold(
              backgroundColor: secondaryColor,
                appBar: customAppBar(
                  text: 'User Profile',
                  actions: [
                    IconButton(onPressed: (){
                      cubit.LogOut();
                      cubit.LogoutPopup(context);
                      Future.delayed(const Duration(seconds: 3), () {
                        navto(context, SignInScreen());
                      });
                    },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 35,
                        ))
                  ]
                ),
                body: Stack(
                  children: [
                    Container(
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                        color: mainColor,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.only(top: 150),
                      padding: EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cubit.showProfileModel!.data?.name ?? '',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Email:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cubit.showProfileModel!.data?.email ?? '',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            cubit.showProfileModel!.data?.phone==null ? '':'Phone:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cubit.showProfileModel!.data?.phone ?? '',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            cubit.showProfileModel!.data?.city==null ? '':'City:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cubit.showProfileModel!.data?.city ?? '',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            cubit.showProfileModel!.data?.address==null ? '':'Address:',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cubit.showProfileModel!.data?.address ?? '',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 32),
                          customElevatedButton(
                              onPressed: () {
                                // Edit profile logic
                                navto(context, EditProfileScreen());
                              },
                              text: 'Edit Profile',
                            backgroundcolor: secondaryColor,
                            style: Styles.BUTTONTEXTSTYLE2

                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 225,
                        color: Colors.transparent,
                        child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children:[
                            Positioned(
                              top: 1,
                              left: 1,
                              right: 1,
                              child: Container(
                                width: 214, // Adjust the width and height as needed
                                height: 214,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/userimg2.png'),
                                    fit: BoxFit.contain, // Adjust the fit mode as needed
                                  ),
                                ),
                              )
                            ),
                            /*Positioned(
                              bottom: 1,
                              right: 1,
                              left: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 100.0,bottom: 40.0),
                                child: CircleAvatar(
                                 backgroundColor: secondaryColor,
                                  radius: 25,
                                  child: IconButton(
                                    onPressed: () async{
                                      final picker = ImagePicker();
                                      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ),
                            ),*/
                          ]
                        ),
                      ),
                    ),
                  ],

                ),
              )
            : Center(
                child: CustomLoadingIndicator(),
              );
      },
    );
  }
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Handle the selected image, e.g., display it or upload it.
      // You can access the image file using pickedFile.path.
    }
  }
}
