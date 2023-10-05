import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_care_clinic/core/Colors.dart';
import 'package:v_care_clinic/core/SharedFunctions.dart';
import 'package:v_care_clinic/core/appfont.dart';
import 'package:v_care_clinic/screens/Books_screen/view/Book_detais_screen.dart';
import 'package:v_care_clinic/screens/Books_screen/view_model/allbook_view_model/all_books_cubit.dart';
import 'package:v_care_clinic/screens/Books_screen/view_model/showbook_view_model/show_book_cubit.dart';
import 'package:v_care_clinic/screens/Fav_screen/viewmodel/fav_cubit.dart';
import 'package:v_care_clinic/screens/Search_screen/view/search_screen.dart';

import '../../Cart_screen/viewmodel/cart_cubit.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllBooksCubit, AllBooksState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AllBooksSucces) {
          FavCubit.get(context).GetAllFav();
        }
      },
      builder: (context, state) {
        // FavCubit.get(context).mysetfav={};
        // int favitem;
        //bool isfavitem;
        var cubit = AllBooksCubit.get(context);
        return cubit.allbooksModel != null
            ? cubit.allbooksModel!.data!.products!.isNotEmpty
                ? Scaffold(
                    appBar: AppBar(
                      actions: [
                        InkWell(
                          child: Icon(Icons.search),
                          onTap: () {
                            navto(context, SearchScreen());
                          },
                        )
                      ],
                    ),
                    body: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:
                                  cubit.allbooksModel!.data!.products!.length,
                              itemBuilder: (BuildContext context, int i) {
                                return InkWell(
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                          width: 5, color: Colors.black26),
                                    ),
                                    width: 150,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Stack(children: [
                                                  Image.network(
                                                    cubit.allbooksModel!.data!
                                                        .products![i].image!,
                                                    fit: BoxFit.fill,
                                                    height: 150,
                                                    width: 200,
                                                  ),
                                                  Container(
                                                    height: 25,
                                                    width: 50,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 3),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3)),
                                                    ),
                                                    child: Text(
                                                      "${cubit.allbooksModel!.data!.products![i].discount.toString()}%",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ],
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Text(
                                                cubit.allbooksModel!.data!
                                                    .products![i].name!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                cubit.allbooksModel!.data!
                                                    .products![i].category!,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                cubit.allbooksModel!.data!
                                                    .products![i].price!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.blueGrey,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                cubit
                                                    .allbooksModel!
                                                    .data!
                                                    .products![i]
                                                    .priceAfterDiscount!
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              BlocConsumer<FavCubit, FavState>(
                                                listener: (context, state) {
                                                  // TODO: implement listener
                                                  if(state is AddFavSuccess)
                                                    {
                                                      FavCubit.get(context).GetAllFav();
                                                    }
                                                },
                                                builder: (context, state) {
                                                  return IconButton(
                                                      onPressed: () {
                                                        FavCubit.get(context)
                                                            .AddFav(cubit
                                                                .allbooksModel!
                                                                .data!
                                                                .products![i]
                                                                .id!
                                                                .toInt());
                                                        //isfavitem=FavCubit.get(context).mysetfav.contains(FavCubit.get(context).showFav2Model!.data!.data[i].id.toInt());
                                                        //isfavitem? favitem=1:favitem=0;
                                                      },
                                                      icon: Icon(
                                                        Icons.favorite_rounded,
                                                         color: (FavCubit.get(context).mysetfav.contains(cubit.allbooksModel!.data!.products![i].id!.toInt()))?Colors.red:Colors.black45,
                                                        size: 30,
                                                      ));
                                                },
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Builder(builder: (contextt) {
                                                return BlocConsumer<CartCubit,
                                                    CartState>(
                                                  listener: (context, state) {
                                                    // TODO: implement listener
                                                    if (state
                                                        is AddCartSuccess) {
                                                      CartCubit.get(context)
                                                          .Showcart();
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    return IconButton(
                                                        onPressed: () {
                                                          CartCubit.get(
                                                                  contextt)
                                                              .AddToCart(cubit
                                                                  .allbooksModel!
                                                                  .data!
                                                                  .products![i]
                                                                  .id!
                                                                  .toInt());
                                                          CartCubit.get(
                                                                  contextt)
                                                              .Showcart();
                                                        },
                                                        icon: Icon(
                                                          FontAwesomeIcons
                                                              .cartPlus,
                                                          color: Colors.black,
                                                          size: 25,
                                                        ));
                                                  },
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    ShowBookCubit.get(context).GetBookDetails(
                                        cubit.allbooksModel!.data!.products![i]
                                            .id!
                                            .toInt());
                                    navto(
                                        context,
                                        BookDetailsScreen(
                                            id: cubit.allbooksModel!.data!
                                                .products![i].id!
                                                .toInt()));
                                    print("id : $i");
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Text("Empty")
            : CircularProgressIndicator();
      },
    );
  }

  /*
  Widget CustomTextfield() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "search",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
   */
}
