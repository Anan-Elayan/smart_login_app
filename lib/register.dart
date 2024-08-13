import 'package:flutter/material.dart';

import 'components/custom_button.dart';
import 'components/custom_contanter.dart';
import 'components/custom_text_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 209, right: 200),
                      child: CustomContainer(
                        height: 80,
                        backgroundColor: Colors.indigo,
                        radius: 0,
                        bottomLeftRadius: 70,
                        bottomRightRadius: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 180, top: 18),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Register",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CustomContainer(
                        backgroundColor: Color(0xFFf2f3f5),
                        radius: 180,
                        height: 400,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: CustomContainer(
                        backgroundColor: Color(0xFFe9ebee),
                        radius: 120,
                        height: 400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          CustomContainer(
                            backgroundColor: const Color(0xFF0f1f41),
                            radius: 150,
                            height: 570,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 107),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Email",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        CustomTextField(
                                          controller: emailController,
                                          hintText: 'Enter your email',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Password",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        CustomTextField(
                                          controller: passwordController,
                                          hintText: 'Enter your password',
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  CustomButton(
                                    buttonText: 'Register',
                                    bgButtonColor: const Color(0xFF2d54ee),
                                    buttonBorderColor: Colors.transparent,
                                    sizeTextButton: 20,
                                    onPress: () {},
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
        ),
      ),
    );
  }
}
