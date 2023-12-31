import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v_care_clinic/core/app_colors.dart';
import 'package:v_care_clinic/core/component.dart';
import 'package:v_care_clinic/screens/Books_screen/view/Books_screen.dart';
import 'package:v_care_clinic/screens/Cart_screen/view/Cart_screen.dart';
import 'package:v_care_clinic/screens/Fav_screen/view/Fav_screen.dart';
import 'package:v_care_clinic/screens/Home_screen/view/home_screen.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/BestSeller_view_model/best_seller_cubit.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/Categories_view_model/categories_cubit.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/New_Arrival_view_model/newarrival_cubit.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/slider_view_model/slider_cubit.dart';

import '../../../../core/shared_widgets.dart';

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: customAppBar(
        text: 'Book Store',
        leading: Icon(
          Icons.menu_book_outlined,
          size: 31,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            children: [
              //Slider implement
              BlocConsumer<SliderCubit, SlidercubitState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var scubit = SliderCubit.get(context);
                  return scubit.slidermodel != null
                      ? scubit.slidermodel!.data!.sliders!.isNotEmpty
                          ? Container(
                              height: 200,
                              child: CarouselSlider(
                                carouselController: controller,
                                items: scubit.slidermodel!.data!.sliders!
                                    .map((imgurl) {
                                  return Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        imgurl.image!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: 300,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.8,
                                ),
                              ))
                          : Text(
                              "data is null",
                              style: TextStyle(fontSize: 50),
                            )
                      : CustomLoadingIndicator();
                },
              ),
              SizedBox(
                height: 10,
              ),
              BlocConsumer<BestSellerCubit, BestSellerState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = BestSellerCubit.get(context);
                  return cubit.bestsellermodel != null
                      ? cubit.bestsellermodel!.data!.products!.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Best Seller",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 270,
                                    width: MediaQuery.of(context).size.width,
                                    // color: Colors.red,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: cubit.bestsellermodel!.data!
                                          .products!.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return customCardWidget(
                                          children: [
                                            Stack(children: [
                                              Image.network(
                                                cubit.bestsellermodel!.data!
                                                    .products![i].image!,
                                                height: 175,
                                                width: 200,
                                                fit: BoxFit.fill,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 50,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: mainColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                ),
                                                child: Text(
                                                  "${cubit.bestsellermodel!.data!.products![i].discount.toString()}%",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: primaryColor),
                                                ),
                                              ),
                                            ]),
                                            Text(
                                              cubit.bestsellermodel!.data!
                                                  .products![i].name!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              cubit.bestsellermodel!.data!
                                                  .products![i].price!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.blueGrey,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              cubit
                                                  .bestsellermodel!
                                                  .data!
                                                  .products![i]
                                                  .priceAfterDiscount!
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text("Empty")
                      : CustomLoadingIndicator();
                },
              ),
              BlocConsumer<CategoriesCubit, CategoriesState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var categorycubit = CategoriesCubit.get(context);
                  return categorycubit.categoriesmodel != null
                      ? categorycubit
                              .categoriesmodel!.data!.categories!.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Categories",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(bottom: 10),
                                    // color: Colors.red,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: categorycubit.categoriesmodel!
                                          .data!.categories!.length,
                                      itemBuilder: (BuildContext context, int i) {
                                        return Container(
                                          height: 50,
                                          width: 150,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          margin:
                                              EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              categorycubit.categoriesmodel!.data!
                                                  .categories![i].name!,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                          )
                          : Text("Empty")
                      : CustomLoadingIndicator();
                },
              ),
              BlocConsumer<NewArrivalCubit, NewArrivalState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = NewArrivalCubit.get(context);
                  return cubit.newarrivalmodel != null
                      ? cubit.newarrivalmodel!.data!.products!.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "New Arrivals",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: cubit.newarrivalmodel!.data!
                                          .products!.length,
                                      itemBuilder: (BuildContext context, int i) {
                                        return customCardWidget(
                                          children: [
                                            Stack(children: [
                                              Image.network(
                                                cubit.newarrivalmodel!.data!
                                                    .products![i].image!,
                                                height: 150,
                                                width: 200,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 50,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 3),

                                                decoration: BoxDecoration(
                                                  color: mainColor,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(3)),
                                                ),
                                                child: Text(
                                                  "${cubit.newarrivalmodel!.data!.products![i].discount.toString()}%",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      color: primaryColor),
                                                ),
                                              ),
                                            ]),
                                            Text(
                                              cubit.newarrivalmodel!.data!
                                                  .products![i].name!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              cubit.newarrivalmodel!.data!
                                                  .products![i].price!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.blueGrey,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              cubit
                                                  .newarrivalmodel!
                                                  .data!
                                                  .products![i]
                                                  .priceAfterDiscount!
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                          )
                          : Text("Empty")
                      : CustomLoadingIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
