import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:v_care_clinic/screens/Cart_screen/model/Remove_cart_model/remove_cart_model.dart';
import 'package:v_care_clinic/screens/Cart_screen/model/add_to_cart_model/Addtocart.dart';
import 'package:v_care_clinic/screens/Cart_screen/model/update_cart_model/Update_cart_model.dart';

import '../../../core/Api.dart';
import '../../../core/cache_helper.dart';
import '../../../core/dio_helper.dart';
import '../model/show_cart_model/Show_car_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final Dio dio=Dio();
  Addtocartmodel?addtocartmodel;
  ShowCartModel?showCartModel;
  UpdateCartModel?updateCartModel;
  RemoveCartModel?removeCartModel;
  static CartCubit get(context) => BlocProvider.of(context);
  List <int> incart=[];
  AddToCart(int product_id)
  {
    emit(AddCartLoading());
    DioHelper.postData(
      url: ApiConst.ADDTOCART,
      data:
      {
        'product_id': product_id,
      },
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      addtocartmodel=Addtocartmodel.fromJson(response.data);
      print(response.data['message']);
      Fluttertoast.showToast(
        msg: "Added Succesfully",
        backgroundColor: Colors.green,
      );
      emit(AddCartSuccess());
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
      emit(AddCartFailure());
    });
  }
  Showcart()
  {
    emit(ShowCartLoading());
    DioHelper.getData(
      url: ApiConst.SHOWCART,
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      print(response.data);
      showCartModel=ShowCartModel.fromJson(response.data);
      print(ShowCartModel.fromJson(response.data));
      print(response.data['message']);
      emit(ShowCartSuccess());
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
      emit(ShowCartFailure());
    });


  }

  void UpdateCart({required String Cart_item_id,required String quantity})
  {
    emit(UpdateCartLoading());
    DioHelper.postData(
      url: ApiConst.UPDATECART,
      data:
      {
        'cart_item_id': Cart_item_id,
        'quantity':quantity,
      },
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      updateCartModel=UpdateCartModel.fromJson(response.data);
      print(response.data['message']);
      Fluttertoast.showToast(
        msg: "Updated Succesfully",
        backgroundColor: Colors.green,
      );
      emit(UpdateCartSuccess());
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
      emit(UpdateCartFailure());
    });
  }

  RemoveCart(int item_product_id)
  {
    emit(RemoveCartLoading());
    DioHelper.postData(
      url: ApiConst.REMOVECART,
      data:
      {
        'cart_item_id': item_product_id,
      },
      token: CacheHelper.getData(key: "token"),
    ).then((response){
      removeCartModel=RemoveCartModel.fromJson(response.data);
      print(response.data['message']);
      Fluttertoast.showToast(
        msg: "Removed Successfully",
        backgroundColor: Colors.green,
      );
      emit(RemoveCartSuccess());
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
      emit(RemoveCartFailure());
    });
  }
}
