import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_care_clinic/core/api.dart';
import 'package:v_care_clinic/screens/register_screen/RegisterModel/RegisterModel2.dart';
import 'package:v_care_clinic/screens/register_screen/view_model/cubit/states.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  final Dio dio = Dio();

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  RegisterModel2? registerModel;
  void addRegister({required String name,required String email,required String password,required String ConfirmPassword}){
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: ApiConst.SIGNUP,
      data: {
        'name':name,
        'email':email,
        'password':password,
        'password_confirmation':ConfirmPassword
      },

    ).then((value) {
      print(value.data['data']['token']);
       CacheHelper.saveData(key:"token", value:value.data['data']['token']);
      print(CacheHelper.getData(key: 'token'));
      emit(RegisterSuccessState());
    }).catchError((errror){
      if(errror is DioException){
        print(errror.response?.data.toString());
      }
      print(errror);
      if(errror is DioError && errror.response?.statusCode==422){
        final e = errror.response?.data;
        final m = e["message"];
        print(e);
        print(m);
      }

      emit(RegisterErrorState());
    });
  }




}
