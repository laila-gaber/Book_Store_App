import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:meta/meta.dart';
import 'package:quickalert/quickalert.dart';
import 'package:v_care_clinic/core/app_colors.dart';
import 'package:v_care_clinic/core/cache_helper.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Profile_screen/model/show_profile_model/Show_profile_model.dart';

import '../../../../core/api.dart';
import '../../../../core/shared_widgets.dart';
import '../../model/log_out_model/LogoutModel.dart';

part 'show_profile_state.dart';

class ShowProfileCubit extends Cubit<ShowProfileState> {
  ShowProfileCubit() : super(ShowProfileInitial());
  static ShowProfileCubit get(context) => BlocProvider.of(context);
  ShowProfileModel ? showProfileModel;
  LogoutModel? logoutmodel;
  final Dio dio=Dio();
  void GetProfileData()
  {
    emit(ShowProfileLoading());
    DioHelper.getData(
        url: ApiConst.SHOWPROFILE,
        token: CacheHelper.getData(key:"token")
    ).then((response) {
      showProfileModel = ShowProfileModel.fromJson(response.data);
      emit(ShowProfileSucces());
    }).catchError((error){
      print("Error in user profile");
      print(" ${error.toString()}");
      if (error is DioError) {
        if (error.response != null) {
          print(error.response!.data);
          print(error.response!.statusCode);
          print(error.response!.statusMessage);

          Map<String, dynamic> data = error.response!.data;

          Fluttertoast.showToast(
            msg: error.response!.statusMessage!,
            backgroundColor: Colors.red,
          );
          //  print(error.response!.headers);
        } else {
          print(error.requestOptions);
          print(error.message);
        }
      } else {
        print(error);
      }
      emit(ShowProfileFailure());
    });
  }
  void LogOut()
  {
    emit(LogoutLoading());
    DioHelper.postData(
      data:{} ,
        url: ApiConst.LOGOUT,
        token: CacheHelper.getData(key:"token")
    ).then((response) {
      logoutmodel = LogoutModel.fromJson(response.data);
      emit(LogoutSuccess());
      print("Logout Successsssss");
      Fluttertoast.showToast(msg: 'sucessfully log out',
        backgroundColor: Colors.green
       );
    }).catchError((error){
      print("Error logoutt");
      print(" ${error.toString()}");
      if (error is DioError) {
        if (error.response != null) {
          print(error.response!.data);
          print(error.response!.statusCode);
          print(error.response!.statusMessage);

          Map<String, dynamic> data = error.response!.data;

          Fluttertoast.showToast(
            msg: error.response!.statusMessage!,
            backgroundColor: Colors.red,
          );
          //  print(error.response!.headers);
        } else {
          print(error.requestOptions);
          print(error.message);
        }
      } else {
        print(error);
      }
      emit(LogoutFailure());
    });
  }
  void LogoutPopup(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      'assets/animations/Animation7.json',
                      fit: BoxFit.fill,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "See You soon...",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: mainColor
                    ),
                  ),
                  // Replace with your sad emoji
                ],
              ),
            ),
          );
        },
      );
    }
  }
