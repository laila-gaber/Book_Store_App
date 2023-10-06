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
          backgroundColor: mainColor,
          appBar: AppBar(
            title: Center(child: Text(
                "Start Search For Books",
              style: TextStyle(
                fontSize: 25
              ),
            )),
            backgroundColor: mainColor,
            elevation:0 ,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.search,
                          color: mainColor,
                          size: 30,
                        ),
                        backgroundColor: Colors.white,

                      ),
                    ) ,
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200],
                        ),
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          cursorColor: mainColor,
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
                          keyboardType: TextInputType.text,
                          controller: searchController,
                          decoration: InputDecoration(
                            //isCollapsed: true,
                            hintText: "Search for a book",
                            hintStyle: TextStyle(
                              fontSize: 20
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                if (state is SearchSuccess &&
                    SearchCubit.get(context).searchProductModel!.data!.products!.isEmpty == false)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: searchcubit.searchProductModel!.data!.products!.length,
                        itemBuilder: (context, i) {
                          return Container(
                            height: 80,
                            margin: EdgeInsets.only(bottom: 20,right: 5,left: 5),
                            child: ListTile(
                              tileColor: Colors.grey[200],
                              leading: Image.network(
                                searchcubit.searchProductModel!.data!.products![i].image,
                                fit: BoxFit.fill,
                                height: 80,
                              ),
                              title: Text(
                                  searchcubit.searchProductModel!.data!.products![i].name,
                                style: Styles.textStyle20,

                              ),
                              subtitle: Text(
                                searchcubit.searchProductModel!.data!.products![i].priceAfterDiscount.toString(),
                                style: Styles.textStyle20,
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  )
                else if (state is SearchLoading)
                  CustomLoadingIndicator()
                else if (state is SearchFailure)
                    CustomErrorWidget(
                      errorMessage: state.errormsg,
                    )
                  else if (state is SearchSuccess && SearchCubit.get(context).searchProductModel!.data!.products!.isEmpty == true)
                      Center(
                        child: Text("There are no items"),
                      ),
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
