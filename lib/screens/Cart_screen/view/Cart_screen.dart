import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_care_clinic/screens/Cart_screen/viewmodel/cart_cubit.dart';
import 'package:v_care_clinic/screens/Check_out_screen/view/check_out_screen.dart';

import '../../../core/Colors.dart';
import '../../../core/SharedFunctions.dart';
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cubit.showCartModel!.data!.cartItems!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
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
                        Spacer(
                          flex: 1,
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
                                    maxLines: 2,
                                  ),
                                  width: 100,
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                IconButton(
                                    onPressed: () {
                                      CartCubit.get(context).RemoveCart(cubit.showCartModel!.data!.cartItems![i].itemId!.toInt());
                                      CartCubit.get(context).Showcart();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 40,
                                    )),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                /*Update_cart_quantity(
                                  context,
                                  cubit.showCartModel!.data!.cartItems![i]
                                      .itemId!
                                      .toInt(),
                                  cubit.showCartModel!.data!.cartItems![i]
                                      .itemQuantity!
                                      .toInt(),
                                ),*/
                                PlusMinusContainer(context,cubit.showCartModel!.data!.cartItems![i]
                                    .itemId!.toString(),cubit.showCartModel!.data!.cartItems![i]
                                    .itemQuantity!.toInt(),
                                  cubit.showCartModel!.data!.cartItems![i].itemProductStock!.toInt(),
                                ),
                               // CartCubit.get(context).Showcart(),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "total:",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.blueGrey,
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
                    );
                  },
                ),
              ),
              Spacer(
                flex: 2,
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
                      "Total: ${cubit.showCartModel!.data!.total!.toString()}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                            color: Colors.purple),
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
            ],
          ),
        );
        else
        {
          return Center(
              child: Text(
                  "There are no items in the cart yet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple
                ),
              ));
        }
        /*
        Text("Empty"):
        CircularProgressIndicator();*/
      },
    );
  }
}

/*
class PlusMinusContainer extends StatefulWidget {
  @override
  _PlusMinusContainerState createState() => _PlusMinusContainerState();
}

class _PlusMinusContainerState extends State<PlusMinusContainer> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  @override

}*/
/*
Widget Update_cart_quantity(
    BuildContext context, int item_id, int initquantity) {
  var cubit = CartCubit.get(context);
  int count = initquantity;
  //int cart_item_id=cubit.showCartModel!.data!.cartItems![item_id].itemProductId!.toInt();
  return Container(
    width: 120,
    height: 50,
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
    padding: EdgeInsets.all(5.0),
    child: Row(
      children: [
        Spacer(
          flex: 1,
        ),
        BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is UpdateCartSuccess) {
              CartCubit.get(context).Showcart();
              print('negeht');
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                --count;
                CartCubit.get(context).updateCartModel!.data!.cartItems![item_id].itemQuantity!;
                print("ana e2st $count");
                CartCubit.get(context)
                    .UpdateCart(Cart_item_id: item_id, quantity: count);
                //CartCubit.get(context).Showcart();
                print("hatshofy el quantity delwa2tyyyyyyyyyyyyyyy");
                print( CartCubit.get(context).updateCartModel!.data!.cartItems![item_id].itemQuantity!);
                //cubit.updateCartModel!.data!.cartItems![item_id].itemQuantity!=count;
                //CartCubit.get(context).UpdateCart(cubit.showCartModel!.data!.cartItems![item_id].itemProductId!.toInt(), count);
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey,
                //padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 22,
                ),
              ),
            );
          },
        ),
        Spacer(
          flex: 1,
        ),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        GestureDetector(
          onTap: () {
            ++count;
            CartCubit.get(context)
                .UpdateCart(Cart_item_id: item_id, quantity: count);
            CartCubit.get(context).Showcart();
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),
        Spacer(
          flex: 1,
        ),
      ],
    ),
  );
}
*/

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
              count!=0?count--:count;
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
