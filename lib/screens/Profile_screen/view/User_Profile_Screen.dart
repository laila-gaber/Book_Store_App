import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_clinic/core/SharedFunctions.dart';
import 'package:v_care_clinic/screens/Profile_screen/view/Edit_Profile_screen.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/show_profile/show_profile_cubit.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowProfileCubit, ShowProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShowProfileCubit.get(context);
        print("abl ma adkhol");
        return cubit.showProfileModel != null
            ? Scaffold(
                appBar: AppBar(
                  title: Text('User Profile'),
                  backgroundColor: Colors.purple,
                ),
                body: Center(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          cubit.showProfileModel!.data?.image ?? '',
                        ),
                      ),
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
                        'Phone:',
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
                        'City:',
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
                        'Address:',
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
                      ElevatedButton(
                        onPressed: () {
                          // Edit profile logic
                          navto(context, EditProfileScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          primary: Colors.purple,
                        ),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
