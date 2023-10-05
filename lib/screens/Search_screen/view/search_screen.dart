import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_care_clinic/screens/Search_screen/view_model/search_pproducts/search_cubit.dart';

import '../../../core/Colors.dart';
import '../../../core/appfont.dart';
import '../../../core/errorwidget.dart';
import '../../../core/loadingWidget.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  // SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is SearchSuccess)
          {
            Fluttertoast.showToast(
              msg: "Successfully get search product",
              backgroundColor: Colors.green,
            );

          }
      },
      builder: (context, state) {
        var searchcubit = SearchCubit.get(context);
        return Scaffold(
          
          body: SafeArea(
            child: Column(
              children: [
                Material(
                  elevation: 10,
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your book';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      SearchCubit.get(context).SearchProduct(searchController.text);
                       print(value);
                      },
                    hintText: "search for a book",
                    inputType: TextInputType.text,
                    icon: Icon(Icons.search),
                    controller: searchController,
                  ),
                ),
                SizedBox(height: 20,),
               // searchcubit.searchProductModel!.data!.products!.isEmpty ?Container(color:Colors.amberAccent,child: CircularProgressIndicator(),) :
                if( state is SearchSuccess && SearchCubit.get(context).searchProductModel!.data!.products!.isEmpty== false)
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.builder(
                            physics: ScrollPhysics(),
                            itemCount: searchcubit.searchProductModel!.data!.products!.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: ListTile(tileColor: Colors.grey[200],
                                    leading: Image.network(searchcubit.searchProductModel!.data!.products![i].image,fit: BoxFit.fill),
                                    title: Text(searchcubit.searchProductModel!.data!.products![i].name),
                                    subtitle: Text(searchcubit.searchProductModel!.data!.products![i].priceAfterDiscount.toString(),style: Styles.textStyle20), //Text(searchcubit.searchProductModel!.data!.products![i].priceAfterDiscount.toString(),style: Styles.textStyle20),),
                                  )
                              );
                            },
                            scrollDirection: Axis.vertical,

                          ),
                        )
                    )
                else if(state is SearchLoading)
                CustomLoadingIndicator()
                else if(state is SearchFailure)
                CustomErrorWidget(errorMessage: state.errormsg,)
                else if( state is SearchSuccess &&SearchCubit.get(context).searchProductModel!.data!.products!.isEmpty== true)
                Center(
                child:Text("There is No Items ")
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.onFieldSubmitted,
    required this.validator,
    this.maxLines,
    this.icon,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final void Function(String)? onFieldSubmitted;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: mainColor,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      keyboardType: inputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff091E4A)),
      borderRadius: BorderRadius.circular(
        4,
      ),
    );
  }
}
