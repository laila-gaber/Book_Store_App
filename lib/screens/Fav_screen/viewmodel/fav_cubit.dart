import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/core/cache_helper.dart';
import 'package:v_care_clinic/screens/Books_screen/model/all_books_model/All_books_model.dart';
import 'package:v_care_clinic/screens/Fav_screen/model/FavouriteModel/FavouriteModel.dart';
import 'package:v_care_clinic/screens/Fav_screen/model/add-fav_model/Addtofavmodel.dart';
import 'package:v_care_clinic/screens/Fav_screen/model/remove_from_fav_model/Removefromfav.dart';
import 'package:v_care_clinic/screens/Fav_screen/model/show_fav_model/Show_fav_model.dart';

import '../../../core/api.dart';
import '../../../core/dio_helper.dart';
import '../model/show_fav2_model/show_fav2_model.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());
  final Dio dio=Dio();
  ShowFav2Model?showFav2Model;
  Addtofavmodel?addtofav;
  Removefromfavmodel?removefromfavmodel;
  AllbooksModel?allbooksModel;
  List<int>favourites=[];
  var mysetfav=<int>{};
  static FavCubit get(context) => BlocProvider.of(context);
  GetAllFav()
  {
    emit(ShowFavLoading());
    mysetfav={};
    DioHelper.getData(
      url: ApiConst.SHOWFAV,
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      showFav2Model=ShowFav2Model.fromJson(response.data);
      print('response\t');
      print(response.data.toString());
      showFav2Model!.data!.data.forEach((element) {
        mysetfav.add(element.id);
      });
      print("list of favshow added $mysetfav");
      emit(ShowFavSuccess());
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
      emit(ShowFavFailure());
    });
  }
  AddFav(int product_id)
  {
    emit(AddFavLoading());
    DioHelper.postData(
      url: ApiConst.ADDFAV,
      data:
      {
        'product_id': product_id,
      },
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      addtofav=Addtofavmodel.fromJson(response.data);
      Fluttertoast.showToast(
        msg: "Added to favourite",
        backgroundColor: Colors.green,
      );
      GetAllFav();
      emit(AddFavSuccess());
    }).catchError((error)
    {
      print("the error isss  ${error.toString()}");
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
      emit(AddFavFailure());
    });


  }
  RemoveFav(int product_id)
  {
    emit(RemoveFavLoading());
    DioHelper.postData(
      url: ApiConst.REMOVEFAV,
      data:
      {
        'product_id': product_id,
      },
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      print(response.data);
      removefromfavmodel=Removefromfavmodel.fromJson(response.data);
      print("list of favvvv remove $mysetfav");
      print(Removefromfavmodel.fromJson(response.data));
      print(response.data['message']);
      Fluttertoast.showToast(
        msg: "Removed from favourite",
        backgroundColor: Colors.green,
      );
      GetAllFav();
      emit(RemoveFavSuccess());
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
      emit(RemoveFavFailure());
    });


  }
}
