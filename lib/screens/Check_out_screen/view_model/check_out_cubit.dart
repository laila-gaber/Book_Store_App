import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/Api.dart';
import 'package:v_care_clinic/screens/Check_out_screen/model/order_model/Order_model.dart';
import 'package:v_care_clinic/screens/Check_out_screen/model/show_chekout_model/Show_check_out_model.dart';

import '../../../core/cache_helper.dart';
import '../../../core/dio_helper.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());
  static CheckOutCubit get(context) => BlocProvider.of(context);
  ShowCheckOutModel?showCheckOutModel;
  OrderModel?orderModel;
  Showorder()
  {
    emit(CheckOutLoading());
    DioHelper.getData(
      url: ApiConst.SHOWCHECKOUT,
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      print(response.data);
      showCheckOutModel=ShowCheckOutModel.fromJson(response.data);
      print(ShowCheckOutModel.fromJson(response.data));
      print(response.data['message']);
      emit(CheckOutSuccess());
    }).catchError((error)
    {
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
      emit(CheckOutFailure());
    });


  }

  void Order({required String name,required String email,required String phone,
    required String city, required String address,}) {
    emit(OrderLoading());
    print('ana dakhalt el update');
    DioHelper.postData(
        url:ApiConst.UPDATE,
        token: CacheHelper.getData(key: "token"),
        data: {
          'name':name,
          'email':email,
          'phone':phone,
          'city':city,
          'address':address,
        }
    ).then((value) {
      orderModel=OrderModel.fromJson(value.data);
      print(value.data);

      emit(OrderSuccess());

    }).catchError((errror){
      if(errror is DioException){
        print(errror.response);
      }
      print(errror);
      if(errror is DioError && errror.response?.statusCode==422){
        final e = errror.response?.data;
        final m = e["message"];
        print(e);
        print(m);
      }
      Fluttertoast.showToast(
        msg: errror.response!.statusMessage!,
        backgroundColor: Colors.red,
      );
      emit(OrderFailure());
    });

  }
}
