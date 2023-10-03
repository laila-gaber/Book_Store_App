import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_care_clinic/screens/Fav_screen/viewmodel/fav_cubit.dart';
import '../../../core/Colors.dart';
import '../../../core/SharedFunctions.dart';
import '../../Books_screen/view/Book_detais_screen.dart';
import '../../Books_screen/view_model/showbook_view_model/show_book_cubit.dart';
/*
class FavScreen extends StatelessWidget {
  FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit, FavState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit= FavCubit.get(context);
                  cubit.favouriteModel!.data != null?
                   Scaffold(
                    body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cubit.favouriteModel!.data!.product!.length,
                        itemBuilder: (BuildContext context, int i) {
                          return InkWell(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border:
                                    Border.all(width: 5, color: Colors.black26),
                              ),
                              width: 150,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Stack(children: [
                                            Image.network(
                                              cubit.favouriteModel!.data!
                                                  .product![i].image!,
                                              fit: BoxFit.fill,
                                              height: 150,
                                              width: 200,
                                            ),
                                            Container(
                                              height: 25,
                                              width: 50,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: mainColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                              ),
                                              child: Text(
                                                "${cubit.favouriteModel!.data!.product![i].discount.toString()}%",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
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
                                          cubit.favouriteModel!.data!
                                              .product![i].name!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          cubit.favouriteModel!.data!
                                              .product![i].category!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          cubit.favouriteModel!.data!
                                              .product![i].price!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.blueGrey,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          cubit.favouriteModel!.data!
                                              .product![i].priceAfterDiscount!
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
                                          },
                                          builder: (context, state) {
                                            var cubit = FavCubit.get(context);
                                            return IconButton(
                                                onPressed: () {
                                                  print(cubit.allbooksModel!
                                                      .data!.products![i].id!);
                                                  //FavCubit.get(context).AddFav(cubit.favouriteModel!.data!.product![i].id!.toInt());
                                                  FavCubit.get(context)
                                                      .GetAllFav();
                                                },
                                                icon: Icon(
                                                  Icons.favorite_rounded,
                                                  color: Colors.black45,
                                                  size: 35,
                                                ));
                                          },
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              print(cubit.allbooksModel!.data!
                                                  .products![i].id!);
                                            },
                                            icon: Icon(
                                              FontAwesomeIcons.cartPlus,
                                              color: Colors.black,
                                              size: 25,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              ShowBookCubit.get(context).GetBookDetails(cubit
                                  .allbooksModel!.data!.products![i].id!
                                  .toInt());
                              navto(
                                  context,
                                  BookDetailsScreen(
                                      id: cubit
                                          .allbooksModel!.data!.products![i].id!
                                          .toInt()));
                              print("id : $i");
                            },
                          );
                        },
                      ),
                    ),
                  ):CircularProgressIndicator();
                },
              );
  }
}*/
class FavScreen extends StatelessWidget {
 // FavScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit, FavState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is RemoveFavSuccess)
          {
            FavCubit.get(context).GetAllFav();
          }
      },
      builder: (context, state) {
        var cubit = FavCubit.get(context);
        if (cubit.showFav2Model!.data != null && cubit.showFav2Model!.data!.data!.length!=0) {
          return Scaffold(
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cubit.showFav2Model!.data!.data!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border:
                          Border.all(width: 5, color: Colors.black26),
                        ),
                        width: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Stack(children: [
                                      Image.network(
                                        cubit.showFav2Model!.data!
                                            .data![i].image!,
                                        fit: BoxFit.fill,
                                        height: 150,
                                        width: 200,
                                      ),
                                      Container(
                                        height: 25,
                                        width: 50,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3)),
                                        ),
                                        child: Text(
                                          "${cubit.showFav2Model!.data!.data![i].discount.toString()}%",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
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
                                    cubit.showFav2Model!.data!
                                        .data![i].name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    cubit.showFav2Model!.data!
                                        .data![i].category!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    cubit.showFav2Model!.data!
                                        .data![i].price!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        decoration:
                                        TextDecoration.lineThrough,
                                        color: Colors.blueGrey,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    cubit.showFav2Model!.data!
                                        .data![i].discount!
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
                                  IconButton(
                                          onPressed: ()
                                          {
                                            FavCubit.get(context).RemoveFav( cubit.showFav2Model!.data!.data![i].id.toInt());
                                            FavCubit.get(context).GetAllFav();
                                          },
                                          icon: Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.black45,
                                            size: 35,
                                          )
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        print(cubit.allbooksModel!.data!
                                            .products![i].id!);
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.cartPlus,
                                        color: Colors.black,
                                        size: 25,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        ShowBookCubit.get(context).GetBookDetails(cubit
                            .showFav2Model!.data!.data![i].id!
                            .toInt());
                        navto(
                            context,
                            BookDetailsScreen(
                                id: cubit
                                    .showFav2Model!.data!.data![i].id!
                                    .toInt()));
                        print("id : $i");
                      },
                    );
                  },
                ),
              ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}