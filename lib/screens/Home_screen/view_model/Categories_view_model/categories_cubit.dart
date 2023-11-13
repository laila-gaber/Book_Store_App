import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/api.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Home_screen/model/categoriesmodel/Categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final Dio dio=Dio();
  CategoriesModel?categoriesmodel;
  static CategoriesCubit get(context) => BlocProvider.of(context);
  GetCategories()
  {
    emit(CategoriesLoading());
    DioHelper.getData(
        url: ApiConst.CATEGORIES,

    ).then((response){
      print(response.data);
      categoriesmodel=CategoriesModel.fromJson(response.data);
      print(CategoriesModel.fromJson(response.data));
      print(response.data['message']);
      emit(CategoriesSucces());
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
      emit(CategoriesFailure());
    });


  }
}
