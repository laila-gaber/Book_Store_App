import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/font.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  void Function(String)? onsubmit,
  required String label_text,
  String? hint_text,
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
        fillColor: primaryColor,
        hoverColor: primaryColor,
        labelStyle: Styles.INFORMFIELDSTYLE,
        hintStyle: Styles.INFORMFIELDSTYLE,
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
        labelText: (label_text),
        hintText: hint_text,
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
Widget customElevatedButton({
  required void Function()? onPressed,
  required String text,
  Color? backgroundcolor,
  TextStyle? style,
}) =>
    SizedBox(
      width: 315,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: backgroundcolor ?? mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5.0),
        child: Text(text, style: style ?? Styles.BUTTONTEXTSTYLE),
      ),
    );

PreferredSizeWidget customAppBar({
  String? text,
  Color? appcolor,
  bool? centeredtitle = false,
  Widget? leading,
  List<Widget>? actions,
}) =>
    AppBar(
      backgroundColor: mainColor,
      title: Text(text ?? "", style: Styles.BUTTONTEXTSTYLE),
      leading: leading,
      centerTitle: centeredtitle,
      actions: actions ?? [],
    );

Widget customCardWidget({
   required List<Widget>? children,
}) =>
    Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        shadowColor: primaryColor,
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          width: 160,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              children: children ?? [],
            ),
          ),
        ),
      ),
    );
