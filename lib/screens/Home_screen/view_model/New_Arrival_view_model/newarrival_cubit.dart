import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/api.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Home_screen/model/New_arrival_model/NewArrivalModel.dart';

part 'newarrival_state.dart';

class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit() : super(NewArrivalInitial());
  final Dio dio=Dio();
  NewArrivalModel?newarrivalmodel;
  static NewArrivalCubit get(context) => BlocProvider.of(context);
  GetNewArrival()
  {
    emit(NewArrivalLoading());
    DioHelper.getData(
        url: ApiConst.NEWARRIVALS,

    ).then((response){
      print(response.data);
      newarrivalmodel=NewArrivalModel.fromJson(response.data);
      print(NewArrivalModel.fromJson(response.data));
      print(response.data['message']);
      emit(NewArrivalSucces());
    }).catchError((error)
    {
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
      emit(NewArrivalFailure());
    });


  }
}
