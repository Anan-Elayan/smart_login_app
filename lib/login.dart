import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smart_login_app/components/custom_button.dart';
import 'package:smart_login_app/components/custom_contanter.dart';
import 'package:smart_login_app/components/custom_text_field.dart';

import 'home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LocalAuthentication auth;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool _supportState = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
        );
    _loadStoredCredentials();
  }

  Future<void> _loadStoredCredentials() async {
    try {
      String? storedEmail = await secureStorage.read(key: 'email');
      print(storedEmail);
      String? storedPassword = await secureStorage.read(key: 'password');
      print(storedPassword);
      if (storedEmail != null) {
        emailController.text = storedEmail;
      }
      if (storedPassword != null) {
        passwordController.text = storedPassword;
      }
    } catch (e) {
      print("Failed to load credentials: $e");
    }
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        // Dummy email and password for example purposes
        String email = emailController.text;
        String password = passwordController.text;

        await secureStorage.write(key: 'email', value: email);
        await secureStorage.write(key: 'password', value: password);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    } on PlatformException catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: "Authentication failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  Future<void> _handleLogin() async {
    // Validate inputs
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter both email and password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    // Dummy authentication logic
    String dummyEmail = emailController.text;
    String dummyPassword = passwordController.text;

    if (emailController.text == dummyEmail &&
        passwordController.text == dummyPassword) {
      await secureStorage.write(key: 'email', value: emailController.text);
      await secureStorage.write(
          key: 'password', value: passwordController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Invalid email or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 209, right: 200),
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
                          "Login",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150, left: 150),
                      child: _supportState
                          ? Text('Supported Biometrics')
                          : Text('Not Supported Biometrics'),
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
                          const CustomContainer(
                            backgroundColor: Color(0xFF0f1f41),
                            radius: 150,
                            height: 570,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Biometric Login Options
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Use smart login",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Column(
                                            //   children: [
                                            //     IconButton(
                                            //       onPressed: _authenticate,
                                            //       icon: const Icon(
                                            //         Icons.face_sharp,
                                            //         color: Colors.white,
                                            //         size: 40,
                                            //       ),
                                            //     ),
                                            //     const Text(
                                            //       "Face ID",
                                            //       style: TextStyle(
                                            //           color: Colors.white70),
                                            //     ),
                                            //   ],
                                            // ),
                                            // const SizedBox(width: 40),
                                            Column(
                                              children: [
                                                IconButton(
                                                  onPressed: _authenticate,
                                                  icon: const Icon(
                                                    Icons.fingerprint_rounded,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                                const Text(
                                                  "Fingerprint",
                                                  style: TextStyle(
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const SizedBox(height: 20),
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
                                        const SizedBox(height: 40),
                                        CustomButton(
                                          buttonText: 'Login',
                                          bgButtonColor:
                                              const Color(0xFF2d54ee),
                                          buttonBorderColor: Colors.transparent,
                                          sizeTextButton: 20,
                                          onPress: _handleLogin,
                                        ),
                                      ],
                                    ),
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
