import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_care_clinic/core/app_colors.dart';
import 'package:v_care_clinic/core/component.dart';
import 'package:v_care_clinic/core/font.dart';
import 'package:v_care_clinic/screens/Books_screen/view_model/showbook_view_model/show_book_cubit.dart';
import 'package:v_care_clinic/screens/Cart_screen/viewmodel/cart_cubit.dart';

import '../../../core/shared_widgets.dart';

class BookDetailsScreen extends StatelessWidget {
  BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowBookCubit, ShowBookState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShowBookCubit.get(context);
        if (cubit.showBookModel!.data != null) {
          if (state is ShowBookLoading) {
            return Container(

              child: Center(child: CustomLoadingIndicator()),
              color: Colors.white,
            );
          }
          else
            return Scaffold(
              appBar: customAppBar(text: 'Book Details'),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.network(
                              cubit.showBookModel!.data!
                                  .image!, // Replace with actual image URL
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 16),
                            Text(
                              cubit.showBookModel!.data!.name!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                    cubit.showBookModel!.data!.category!,
                                    style: Styles.SUBHEADERSTEXTSTYLE
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      cubit.showBookModel!.data!.price!,
                                      style: TextStyle(
                                          decoration: TextDecoration
                                              .lineThrough,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      cubit.showBookModel!.data!
                                          .priceAfterDiscount!
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: mainColor
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              cubit.showBookModel!.data!.description!,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: BlocListener<CartCubit, CartState>(

                      listener: (context, state) {
                        // TODO: implement listener
                        var cubit=CartCubit.get(context);
                      },
                      child: customElevatedButton(
                          onPressed: () {
                            CartCubit.get(
                                context)
                                .AddToCart(cubit.showBookModel!.data!.id!.toInt());
                            CartCubit.get(
                                context)
                                .Showcart();
                          }
                          , text: 'Add to Cart'
                      ),
                    ),
                  )
                ],
              ),
            );
        }
        else
          return CustomLoadingIndicator();
      },
    );
  }
}
