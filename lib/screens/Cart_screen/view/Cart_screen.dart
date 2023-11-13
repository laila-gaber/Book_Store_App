import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:v_care_clinic/screens/Cart_screen/viewmodel/cart_cubit.dart';
import 'package:v_care_clinic/screens/Check_out_screen/view/check_out_screen.dart';

import '../../../core/app_colors.dart';
import '../../../core/component.dart';
import '../../../core/shared_functions.dart';
import '../../Books_screen/view/Book_detais_screen.dart';
import '../../Books_screen/view_model/showbook_view_model/show_book_cubit.dart';
import '../../Fav_screen/viewmodel/fav_cubit.dart';
import '../viewmodel/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is RemoveCartSuccess || state is UpdateCartSuccess )
          {
            CartCubit.get(context).Showcart();
          }
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        if(cubit.showCartModel!.data!.cartItems!.isNotEmpty)
        return Scaffold(
          backgroundColor: secondaryColor,
          appBar: customAppBar(text: "Your Cart"),
          body: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: cubit.showCartModel!.data!.cartItems!.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Stack(
                                children: [
                                Image.network(
                                  cubit.showCartModel!.data!.cartItems![i]
                                      .itemProductImage!,
                                  fit: BoxFit.fill,
                                  height: 150,
                                  width: 120,
                                ),
                                Container(
                                  height: 25,
                                  width: 50,
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                  child: Text(
                                    "${cubit.showCartModel!.data!.cartItems![i].itemProductDiscount!.toString()}%",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ]),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        cubit.showCartModel!.data!.cartItems![i]
                                            .itemProductName!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        overflow:TextOverflow.ellipsis ,
                                      ),
                                      width: 100,
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          CartCubit.get(context).RemoveCart(cubit.showCartModel!.data!.cartItems![i].itemId!.toInt());
                                          CartCubit.get(context).Showcart();
                                        },
                                        icon: Icon(
                                          Icons.remove_circle_outline_sharp,
                                          color: primaryColor,
                                          size: 30,
                                        )),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  children: [
                                    PlusMinusContainer(context,cubit.showCartModel!.data!.cartItems![i]
                                        .itemId!.toString(),cubit.showCartModel!.data!.cartItems![i]
                                        .itemQuantity!.toInt(),
                                      cubit.showCartModel!.data!.cartItems![i].itemProductStock!.toInt(),
                                    ),
                                   // CartCubit.get(context).Showcart(),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Total",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          cubit.showCartModel!.data!.cartItems![i]
                                              .itemTotal!
                                              .toStringAsFixed(2),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: mainColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                child: Card(
                  color: mainColor,

                  elevation: 3,
                  margin: EdgeInsets.all(10),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Total: ${cubit.showCartModel!.data!.total!.toString()}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22, color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            navto(context, CheckOutScreen());
                          },
                          child: Text(
                            "Check Out",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(50, 50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        else
        {
          return Scaffold(
            backgroundColor: secondaryColor,
            appBar: customAppBar(text: "Your Cart"),
            body: Center(
              child: SizedBox(
                  child: Lottie.asset('assets/animations/Animation16.json')
              ),
            ),
          );
        }
      },
    );
  }
}

Widget PlusMinusContainer(BuildContext context , String item , int initquantity, int stock) {
  int count= initquantity;
  String quantity_count= initquantity.toString();
    return Container(
      width: 120,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      //padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          InkWell(
            child: CircleAvatar(
              radius: 15,
              backgroundColor: mainColor,
                child: Icon(
                    Icons.arrow_circle_down_rounded,
                color: Colors.white,
                  size: 30,
                )
            ),
            onTap: ()
            {
              print("count$count");
              if(count==1)
                {
                  Fluttertoast.showToast(
                    msg:"The minimum amount is 1",
                    backgroundColor: Colors.yellow,
                  );
                }
              else if(count>1)
                {
                  count=count-1;

                }
              if(count<=stock) {
                CartCubit.get(context).UpdateCart(
                    Cart_item_id: item, quantity: count.toString());
                quantity_count = count.toString();
              }
              else if(count>stock)
                {
                  Fluttertoast.showToast(
                      msg:"Not Enough Stock",
                    backgroundColor: Colors.amber
                  );
                }
            },
          ),
          SizedBox(width: 16.0),
          Text(
            '$quantity_count',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 16.0),
          InkWell(
            child: CircleAvatar(
                radius: 15,
                backgroundColor: mainColor,
                child: Icon(
                  Icons.arrow_circle_up_outlined,
                  color: Colors.white,
                  size: 30,
                )
            ),
            onTap: ()
            {
              print("count$count");
              count++;
              print("count after func$count");
            if(count<=stock) {
              CartCubit.get(context).UpdateCart(
                  Cart_item_id: item, quantity: count.toString());
              print("count after calling cubit$count");
              print("item after$item");
              quantity_count = count.toString();
            }
            else if(count>stock)
            {
              Fluttertoast.showToast(
                  msg:"Not Enough Stock",
                  backgroundColor: Colors.amber
              );
            }
            },
          ),
        ],
      ),
    );
  }
