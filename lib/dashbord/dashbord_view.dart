import 'package:flutter/material.dart';
import 'package:smart_login_app/components/custom_button.dart';
import 'package:smart_login_app/components/custom_contanter.dart';
import 'package:smart_login_app/login.dart';

import '../register.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.asset('assets/images/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                "Smart Login app",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: CustomContainer(
                    backgroundColor: Color(0xFFf2f3f5),
                    radius: 180,
                    height: 500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: CustomContainer(
                    backgroundColor: Color(0xFFe9ebee),
                    radius: 170,
                    height: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Stack(
                    children: [
                      const CustomContainer(
                        backgroundColor: Color(0xFF0f1f41),
                        radius: 150,
                        height: 300,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 107),
                          child: Column(
                            children: [
                              CustomButton(
                                buttonText: 'Login',
                                sizeTextButton: 20,
                                bgButtonColor: Color(0xff2d54ee),
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginView(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                buttonText: 'SignUp',
                                sizeTextButton: 20,
                                bgButtonColor: Colors.transparent,
                                buttonBorderColor: const Color(0xFF2d54ee),
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Register(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
