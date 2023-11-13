import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:v_care_clinic/core/component.dart';
import 'package:v_care_clinic/screens/Search_screen/view_model/search_pproducts/search_cubit.dart';

import '../../../core/app_colors.dart';
import '../../../core/font.dart';
import '../../../core/shared_widgets.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  // SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var searchcubit = SearchCubit.get(context);
        return Scaffold(
          backgroundColor: secondaryColor,
          appBar: customAppBar(
            text: "Start Search For Books",
            centeredtitle: true
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onsubmit: (value) {
                      SearchCubit.get(context).SearchProduct(searchController.text);
                      print(value);
                      },
                      validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the book name';
                    }
                    return null;
                  },
                      label_text: "search here",
                    hint_text: "Enter the book name",

                  ),
                ),
                if (state is SearchSuccess &&
                    SearchCubit.get(context).searchProductModel!.data!.products!.isEmpty == false)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: searchcubit.searchProductModel!.data!.products!.length,
                        itemBuilder: (context, i) {
                          return Card(
                            elevation: 5,
                            margin: EdgeInsets.all(10),

                            child: Container(
                              height: 90,
                              padding: EdgeInsets.all(5),
                              child: ListTile(
                                leading: Image.network(
                                  searchcubit.searchProductModel!.data!.products![i].image,
                                  fit: BoxFit.fill,
                                  height: 90,
                                  width: 50,
                                ),
                                title: Text(
                                    searchcubit.searchProductModel!.data!.products![i].name,
                                  style: Styles.textStyle20,
                                  maxLines: 2,

                                ),
                                subtitle: Text(
                                  searchcubit.searchProductModel!.data!.products![i].priceAfterDiscount.toString(),
                                  style: Styles.textStyle20,
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  )
                else if (state is SearchLoading)
                  Expanded(child: CustomLoadingIndicator())
                else if (state is SearchFailure)
                    CustomErrorWidget(
                      errorMessage: state.errormsg,
                    )
                  else if (state is SearchSuccess && SearchCubit.get(context).searchProductModel!.data!.products!.isEmpty == true)
                     Expanded(
                       child: SizedBox(
                       child: Lottie.asset('assets/animations/Animation13.json')
                       ),
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
