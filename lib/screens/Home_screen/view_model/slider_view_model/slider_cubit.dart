import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/Api.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Home_screen/model/slidermodel/Slider_model.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SlidercubitState> {
  final Dio dio=Dio();
  static SliderCubit get(context) => BlocProvider.of(context);

  SliderCubit() : super(SlidercubitInitial());
  SliderModel?slidermodel;
  void GetSlider()
  {
    emit(SlidercubitLoading());
    DioHelper.getData(
        url: ApiConst.Slider,
    ).then((response){
      slidermodel=SliderModel.fromJson(response.data);
      print(SliderModel.fromJson(response.data));
      print(response.data['message']);
      emit(SlidercubitSucces());
    }).catchError((error){
      print("Error in Slider");
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
      emit(SlidercubitFailure());
    });
  }
}
