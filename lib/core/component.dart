import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v_care_clinic/core/SharedFunctions.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  void Function(String)? onsubmit,
  required String label,
  IconData? prifex,
  int? maxline,
  void Function()? ontap,
  void Function(String)? onChange,
  bool isclickable = true,
  IconData? suffix,
  bool isPassword = false,
  void Function()? suffixpressed,
}) =>
    TextFormField(
// onTap:ontap ,
      enabled: isclickable,
      onChanged: onChange,
      obscureText: isPassword,
      controller: controller,
      validator: validate,
      keyboardType: TextInputType.text,
      onFieldSubmitted: onsubmit,
      cursorColor: Colors.black,
      maxLines: maxline,

      decoration: InputDecoration(
        fillColor: Colors.black,
        hoverColor: Colors.black,
        labelStyle: GoogleFonts.roboto(color: Colors.black),

        hintStyle: GoogleFonts.roboto(
          color: Colors.black,
        ),

        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
//
        labelText: (label),
        prefixIcon: Icon(prifex, color: Colors.black),
        suffixIcon: suffix != null
            ? IconButton(
                color: Colors.black,
                onPressed: suffixpressed,
                icon: Icon(suffix))
            : null,
      ),
    );

//bottom nav bar
Widget CustomBottomAppBar({
  required IconData pageIcon,
  required String pageText,
  required BuildContext pagecontext,
  required Widget navscreen,
}) =>
    BottomAppBar(
      color: Colors.white,
      // shape: CircularNotchedRectangle(),
      // notchMargin: 0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  navto(pagecontext, navscreen);
                },
              ),
              Text(
                'Home',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu_book_sharp,
                ),
                onPressed: () {
                 navto(pagecontext, navscreen);
                },
              ),
              Text(
                'Books',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_rounded, color: Colors.red),
                onPressed: () {
                  navto(pagecontext, navscreen);
                },
              ),
              Text(
                'Favourite',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  navto(pagecontext, navscreen);
                },
              ),
              Text(
                'Cart',
                style: TextStyle(fontSize: 12, color: HexColor('#174068')),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.account_box,
                ),
                onPressed: () {
                  navto(pagecontext, navscreen);
                },
              ),
              Text(
                'Profile',
                style: TextStyle(fontSize: 12, color: HexColor('#174068')),
              ),
            ],
          ),
        ],
      ),
    );
