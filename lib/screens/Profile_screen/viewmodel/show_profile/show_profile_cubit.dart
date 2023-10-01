import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/cache_helper.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Profile_screen/model/show_profile_model/Show_profile_model.dart';

import '../../../../core/Api.dart';

part 'show_profile_state.dart';

class ShowProfileCubit extends Cubit<ShowProfileState> {
  ShowProfileCubit() : super(ShowProfileInitial());
  static ShowProfileCubit get(context) => BlocProvider.of(context);

  ShowProfileModel ? showProfileModel;
  final Dio dio=Dio();
  void GetProfileData()
  {
    print("Ana dakhaltttttttttttttttt");
    emit(ShowProfileLoading());

    DioHelper.getData(url: ApiConst.SHOWPROFILE,
        token: CacheHelper.getData(key: "token")
    )
        .then((response) {
      showProfileModel = ShowProfileModel.fromJson(response.data);
      print("in user profile  sucessssssss");

      print(response.data);

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

}
