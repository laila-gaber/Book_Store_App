import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_care_clinic/core/component.dart';
import 'package:v_care_clinic/core/font.dart';
import 'package:v_care_clinic/core/shared_functions.dart';
import 'package:v_care_clinic/screens/Cart_screen/viewmodel/cart_cubit.dart';
import 'package:v_care_clinic/screens/Check_out_screen/view_model/check_out_cubit.dart';
import 'package:quickalert/quickalert.dart';
import '../../../core/app_colors.dart';
import '../../Cart_screen/view/Cart_screen.dart';

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
    return BlocConsumer<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        if(state is OrderSuccess)
          {
            Future.delayed(Duration(seconds: 4));
            Navigator.pop(context);
          }
        if(state is ClearCartSuccess)
          {

          }
        return Scaffold(
          backgroundColor: secondaryColor,
          appBar: customAppBar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
                  child: Column(
                    children: [
                      Text('Place Your Order', style: Styles.HEADERSTEXTSTYLE1),
                      SizedBox(height: 10),
                      Text(
                        'Order your books with a single tap!',
                        style: Styles.SUBHEADERSTEXTSTYLE,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            defaultFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                } else if (nameController.text.length < 3) {
                                  return 'name must be more than 3 characters';
                                }
                                return null;
                              },
                              label_text: 'Name',
                            ),
                            SizedBox(height: 20),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!value.contains('@')) {
                                  return 'Please enter your valid email';
                                }
                                return null;
                              },
                              label_text: 'Email',
                            ),
                            SizedBox(height: 20),
                            defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone';
                                } else if (value.length < 11) {
                                  return 'Please enter your valid phone number';
                                }
                              },
                              label_text: 'Phone',
                            ),
                            SizedBox(height: 20),
                            defaultFormField(
                              controller: CityController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your city ';
                                }
                                return null;
                              },
                              label_text: 'City',
                            ),
                            SizedBox(height: 20),
                            defaultFormField(
                              controller: AdressController,
                              type: TextInputType.streetAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your adress ';
                                }
                                return null;
                              },
                              label_text: 'Adress',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100.h,),
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
                            "Total Price: ${cubit.showCartModel!.data!.total!.toString()}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(flex: 1,),
                          ElevatedButton(
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
                                CartCubit.get(context).Clearcart();
                                CheckOutCubit.get(context).showPopup(context);
                              }
                            },
                            child: Text(
                              "Order Now!",
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
          ),
        );

      },
    );

  }

}
