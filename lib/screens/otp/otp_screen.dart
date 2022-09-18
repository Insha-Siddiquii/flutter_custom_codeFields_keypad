import 'package:flutter/material.dart';
import 'package:flutter_app_otp/screens/otp/widget/custom_form.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 103, 99, 99),
            size: 20,
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Verify account',
              style: TextStyle(
                color: Color.fromARGB(255, 23, 22, 22),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "Enter the 4-digit code we have sent to ",
                style: TextStyle(
                  color: Color.fromARGB(255, 103, 99, 99),
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: "atine@gmail.com",
                    style: TextStyle(
                      color: Color.fromARGB(255, 116, 184, 240),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomFormFields(),
          ],
        ),
      ),
    );
  }
}
