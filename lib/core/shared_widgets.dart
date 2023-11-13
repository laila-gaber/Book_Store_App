import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:v_care_clinic/core/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
        backgroundColor: secondaryColor,
        strokeWidth: 5,
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          errorMessage,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            // textAlign: TextAlign.center,
          ),
        ));
  }
}

class CustomPopupContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.mood_bad, // Replace with your "Goodbye" icon
          size: 48,
          color: Colors.red,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("It's not good bye it's see you soon"),
            SizedBox(width: 8),
            Text("😢", style: TextStyle(fontSize: 24),),
            // Replace with your sad emoji
          ],
        ),
      ],
    );
  }
}