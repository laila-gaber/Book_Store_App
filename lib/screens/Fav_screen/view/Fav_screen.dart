import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:v_care_clinic/core/component.dart';
import 'package:v_care_clinic/core/font.dart';
import 'package:v_care_clinic/screens/Fav_screen/viewmodel/fav_cubit.dart';
import '../../../core/app_colors.dart';
import '../../../core/shared_functions.dart';
import '../../../core/shared_widgets.dart';
import '../../Books_screen/view/Book_detais_screen.dart';
import '../../Books_screen/view_model/showbook_view_model/show_book_cubit.dart';

class FavScreen extends StatelessWidget {
  FavScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit, FavState>(
      listener: (context, state) {
        // TODO: implement listener
        /*if(state is RemoveFavSuccess || state is AddFavSuccess)
        {
           FavCubit.get(context).GetAllFav();
        }*/
      },
      builder: (context, state) {
        var cubit = FavCubit.get(context);

        if (cubit.showFav2Model!.data !=null && cubit.showFav2Model!.data!.data != null ) {

          print("\n\nchecking the set ${cubit.mysetfav!.isEmpty}\n");
          if(cubit.mysetfav!.isEmpty)
          {
            return Scaffold(
              backgroundColor: secondaryColor,
              appBar: customAppBar(text: "Your Favourites"),
              body: Center(
                  child: SizedBox(
                      child: Lottie.asset('assets/animations/Animation16.json')
                  ),
              ),
            );
          }
          else if(cubit.mysetfav!.isNotEmpty ||state is RemoveFavSuccess){
            return Scaffold(
              backgroundColor: secondaryColor,
              appBar: customAppBar(text: "Your favourites "),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cubit.showFav2Model!.data!.data!.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                    maxLines: 3,
                                    overflow:TextOverflow.ellipsis
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
                            Column(
                              children: [
                                IconButton(
                                    onPressed: ()
                                    {
                                      FavCubit.get(context).RemoveFav( cubit.showFav2Model!.data!.data![i].id.toInt());
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: primaryColor,
                                      size: 30,
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }

        }
        else {
          //FavCubit.get(context).GetAllFav();
          return CustomLoadingIndicator();
        }
        return Center(
            child: Text(
              "There are no items in the Fav yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple
              ),
            ));
      },
    );
  }
}

