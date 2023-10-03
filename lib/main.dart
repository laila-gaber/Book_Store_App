import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_clinic/bottomnavbar.dart';
import 'package:v_care_clinic/screens/Books_screen/view/Book_detais_screen.dart';
import 'package:v_care_clinic/screens/Books_screen/view_model/allbook_view_model/all_books_cubit.dart';
import 'package:v_care_clinic/screens/Books_screen/view_model/showbook_view_model/show_book_cubit.dart';
import 'package:v_care_clinic/screens/Cart_screen/viewmodel/cart_cubit.dart';
import 'package:v_care_clinic/screens/Fav_screen/viewmodel/fav_cubit.dart';
import 'package:v_care_clinic/screens/Home_screen/view/home_screen.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/BestSeller_view_model/best_seller_cubit.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/Categories_view_model/categories_cubit.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/New_Arrival_view_model/newarrival_cubit.dart';
import 'package:v_care_clinic/screens/Home_screen/view_model/slider_view_model/slider_cubit.dart';
import 'package:v_care_clinic/screens/LoginScreen/viewmodel/SignIncubit/SigninCubit.dart';
import 'package:v_care_clinic/screens/Profile_screen/view/User_Profile_Screen.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/edit_profile/edit_profile_cubit.dart';
import 'package:v_care_clinic/screens/Profile_screen/viewmodel/show_profile/show_profile_cubit.dart';
import 'package:v_care_clinic/screens/home_screen/view/widget/home_screen_body.dart';
import 'package:v_care_clinic/screens/nav/navbar.dart';

import 'package:v_care_clinic/screens/register_screen/view/register_screen.dart';
import 'package:v_care_clinic/screens/register_screen/view_model/cubit/cubit.dart';
import 'package:v_care_clinic/screens/splash_screen/splash_screen.dart';

import 'core/bloc_observer.dart';
import 'core/cache_helper.dart';
import 'core/dio_helper.dart';
import 'screens/Books_screen/view/Books_screen.dart';
import 'screens/BottomNav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.Init_dio();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=> RegisterCubit()),
            BlocProvider(create: (context)=>  SignInCubit()),
            BlocProvider(create: (context)=>  SliderCubit()..GetSlider()),
            BlocProvider(create: (context)=>  BestSellerCubit()..GetBestSeller()),
            BlocProvider(create: (context)=>  CategoriesCubit()..GetCategories()),
            BlocProvider(create: (context)=>  NewArrivalCubit()..GetNewArrival()),
            BlocProvider(create: (context)=>  AllBooksCubit()..GetAllBooks()),
            BlocProvider(create: (context)=>  ShowBookCubit()),
            BlocProvider(create: (context)=>  ShowProfileCubit()..GetProfileData()),
            BlocProvider(create: (context)=>  EditProfileCubit()),
            BlocProvider(create: (context)=>  FavCubit()..GetAllFav()),
           BlocProvider(create: (context)=>  CartCubit()..Showcart())

          ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home:SplashScreen(),
        ),
      ),
    );
  }
}

