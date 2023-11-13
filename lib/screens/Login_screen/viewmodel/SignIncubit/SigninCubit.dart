import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_care_clinic/core/api.dart';
import 'package:v_care_clinic/core/cache_helper.dart';
import 'package:v_care_clinic/core/dio_helper.dart';

import '../../../register_screen/RegisterModel/RegisterModel2.dart';
import 'SignInStates.dart';


class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());
  static SignInCubit get(context) => BlocProvider.of(context);
  bool iskeepsigninSelected = false;

  void changeGenderSelection(bool value) {
    iskeepsigninSelected = value;
    emit(keepsigninSelectionChangedState(iskeepsigninSelected));
  }

  RegisterModel2 ? signinModel;

  void SignIn
      (
      String email,
      String password,
          ) {

    emit(SignInLoadingState());

    DioHelper.postData(
      url: ApiConst.SIGNIN,
      token: CacheHelper.getData(key: "token"),
      data: {
        'email': email,
        'password':password,
      },
    ).then((response) {
      signinModel = RegisterModel2.fromJson(response.data);

      print(response.data);
      CacheHelper.saveData(key:"token", value:response.data['data']['token']);

      emit(SignInSuccessState(signinModel!));
    }).catchError((error){
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
      /* if (error is DioError && error.response?.statusCode == 401) {
        final data = error.response?.data;
        final message = data['message'];
        Fluttertoast.showToast(
          msg: "$message",
          backgroundColor: Colors.red,
        );

        // final errors = Map<String, List<String>>.from(data['errors']);
      }*/
      emit(SignInErrorState(error.toString()));
    });
  }





}