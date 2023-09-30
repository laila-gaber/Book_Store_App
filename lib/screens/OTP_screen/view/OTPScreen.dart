import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter the verification code',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOtpTextField(),
                buildOtpTextField(),
                buildOtpTextField(),
                buildOtpTextField(),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // OTP verification logic here

              },
              child: Text('Verify'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Resend OTP logic here
              },
              child: Text('Resend OTP'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpTextField() {
    return Container(
      width: 60.0,
      height: 60.0,
      child:const TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 24.0),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}