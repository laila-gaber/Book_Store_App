import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../../../core/api.dart';
import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';
import '../../model/search_model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  SearchProductModel? searchProductModel;
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchProduct(String bookname)
  {
    emit(SearchLoading());
    DioHelper.getData(
      url: ApiConst.BASEURL+'/products-search?name=$bookname'
      //token: CacheHelper.getData(key: "token"),
    ).then((response){
      print(response.data);
      print('sucesssssssssssssssss');
      searchProductModel=SearchProductModel.fromJson(response.data);
      print(searchProductModel!.data!.products!.length);
      Fluttertoast.showToast(
        msg: "founded ${searchProductModel!.data!.products!.length} results ",
        backgroundColor: Colors.green,
      );
      emit(SearchSuccess());
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
      emit(SearchFailure(error));
    });
  }
}
