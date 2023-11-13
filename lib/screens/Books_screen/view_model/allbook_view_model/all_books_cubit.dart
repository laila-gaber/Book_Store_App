import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/api.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Books_screen/model/all_books_model/All_books_model.dart';

part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit() : super(AllBooksInitial());
  final Dio dio=Dio();
  AllbooksModel?allbooksModel;
  Map<int,bool>favourites={};
  static AllBooksCubit get(context) => BlocProvider.of(context);
  GetAllBooks()
  {
    emit(AllBooksLoading());
    DioHelper.getData(
      url: ApiConst.ALLBOOKS,

    ).then((response){
      print(response.data);
      allbooksModel=AllbooksModel.fromJson(response.data);
      print(AllbooksModel.fromJson(response.data));
      print(response.data['message']);
      emit(AllBooksSucces());
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
      emit(AllBooksFailure());
    });


  }

}
