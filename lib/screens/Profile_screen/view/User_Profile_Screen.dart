/*import 'package:flutter/material.dart';
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
        var cubit=ShowProfileCubit.get(context);
        print("abl ma adkhol");
        return cubit.showProfileModel != null?
         Scaffold(
          appBar: AppBar(
            title: Text('User Profile'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data!.name!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data!.email!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Phone:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data!.phone!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'City:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data!.city!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Address:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data!.address!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Edit profile logic
                    navto(context, EditProfileScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ):CircularProgressIndicator();
      },
    );
  }
}*/
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
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data?.name ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data?.email ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Phone:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data?.phone ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'City:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data?.city ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Address:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  cubit.showProfileModel!.data?.address ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Edit profile logic
                    navto(context, EditProfileScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text('Edit Profile'),
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