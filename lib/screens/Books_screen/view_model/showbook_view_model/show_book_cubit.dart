import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/Api.dart';
import 'package:v_care_clinic/core/dio_helper.dart';
import 'package:v_care_clinic/screens/Books_screen/model/show_book_model/Show_book_details.dart';
part 'show_book_state.dart';

class ShowBookCubit extends Cubit<ShowBookState> {
  ShowBookCubit() : super(ShowBookInitial());
  final Dio dio=Dio();
  ShowBookModel?showBookModel;
  static ShowBookCubit get(context) => BlocProvider.of(context);
  GetBookDetails(int? id)
  {
    emit(ShowBookLoading());
    DioHelper.getData(
      url:"/products/$id",
    ).then((response){
      print("ana dakhalttttt");
      print(response.data);
      showBookModel=ShowBookModel.fromJson(response.data);
      print(ShowBookModel.fromJson(response.data));
      print(response.data['message']);
      emit(ShowBookSucces());
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
      emit(ShowBookFailure());
    });


  }
}
