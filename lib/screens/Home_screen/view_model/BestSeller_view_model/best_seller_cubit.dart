import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/Api.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Home_screen/model/bestsellermodel/Best_Seller_Model.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());
  final Dio dio=Dio();
  BestSellerModel?bestsellermodel;
  static BestSellerCubit get(context) => BlocProvider.of(context);
  GetBestSeller()
  {
    emit(BestSellerLoading());
    DioHelper.getData(
        url: ApiConst.BESTSELLER,

    ).then((response){
      print(response.data);
      bestsellermodel=BestSellerModel.fromJson(response.data);
      print(BestSellerModel.fromJson(response.data));
      print(response.data['message']);
      emit(BestSellerSucces());
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
      emit(BestSellerFailure());
    });


  }
}
