import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_care_clinic/screens/Cart_screen/viewmodel/cart_cubit.dart';
import 'package:v_care_clinic/screens/Check_out_screen/view_model/check_out_cubit.dart';

import '../../../core/Colors.dart';

class CheckOutScreen extends StatelessWidget {

  bool isvisible = false;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var CityController = TextEditingController();
  var AdressController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  CheckOutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is RemoveCartSuccess)
        {
          CartCubit.get(context).Showcart();
        }
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        'Place Your Order',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'order your books with a single tap!',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0XFF030E19),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          else if (nameController.text.length < 3) {
                            return 'name must be more than 3 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          else if (!value.contains('@')) {
                            return 'Please enter your valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          }
                          else if (value.length < 11) {
                            return 'Please enter your valid phone number';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone',

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: CityController,
                        keyboardType: TextInputType.name,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your city ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'City',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: AdressController,
                        keyboardType: TextInputType.streetAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your adress ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Adress',

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height - 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: cubit.showCartModel!.data!.cartItems!.length,
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        child: Container(
                          margin: EdgeInsets.all(7),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.purple.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3),
                                  blurStyle: BlurStyle.normal),
                            ],
                          ),
                          width: 150,
                          child: Row(children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Stack(children: [
                                SizedBox(
                                  child: Image.network(
                                    cubit.showCartModel!.data!.cartItems![i]
                                        .itemProductImage!,
                                    fit: BoxFit.fill,
                                  ),
                                  width: 100,
                                  height: 130,
                                ),
                                Container(
                                  height: 25,
                                  width: 50,
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
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
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                      ),
                                      width: 120,
                                    ),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Text(
                                      cubit.showCartModel!.data!.cartItems![i]
                                          .itemProductPriceAfterDiscount!
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 50.0,right: 0),
                                  child: Text(
                                      "Quantity: 2",
                                      style:TextStyle(
                                        fontSize: 20
                                      ),
                                  ),
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.purple,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(7),
                child: Row(
                  children: [
                    Text(
                      "Total Price: ${cubit.showCartModel!.data!.total!.toString()}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    BlocConsumer<CheckOutCubit, CheckOutState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          isvisible = true;
                          CheckOutCubit.get(context).Order(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            city: CityController.text,
                            address: AdressController.text,
                          );
                          if(state is OrderSuccess)
                            {
                              Fluttertoast.showToast(
                                    backgroundColor: Colors.green,
                                  msg: "Order Placed"
                              );
                            }
                        }
                      },
                      child: Text(
                        "Order Now!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size(50, 50),
                      ),
                    );
  },
),
                  ],
                ),
              ),
            ],
          ),
        );
        /*
        Text("Empty"):
        CircularProgressIndicator();*/
      },
    );
  }
}

