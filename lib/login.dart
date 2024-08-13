import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _supportState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
        );
  }

  // final LocalAuthentication auth = LocalAuthentication();
  // bool _canCheckBiometrics = false;
  // String _authorized = 'Not Authorized';
  // bool _isAuthenticating = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _checkBiometrics();
  // }
  //
  // Future<void> _checkBiometrics() async {
  //   bool canCheckBiometrics = false;
  //   bool isDeviceSupported = false;
  //
  //   try {
  //     _canCheckBiometrics = await auth.canCheckBiometrics;
  //     isDeviceSupported = await auth.isDeviceSupported();
  //   } catch (e) {
  //     canCheckBiometrics = false;
  //     print("Error checking biometrics: $e");
  //   }
  //   setState(() {
  //     _canCheckBiometrics = canCheckBiometrics! && isDeviceSupported;
  //   });
  // }
  //
  // Future<void> _authenticate() async {
  //   print("Authentication started");
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Scan your face or fingerprint to authenticate',
  //       options: const AuthenticationOptions(
  //         useErrorDialogs: true,
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );
  //
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = authenticated ? 'Authorized' : 'Not Authorized';
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error: ${e.toString()}';
  //     });
  //     print("Authentication error: $e");
  //     return;
  //   }
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _authorized = authenticated ? 'Authorized' : 'Not Authorized';
  //   });
  //
  //   print("Authentication completed: $_authorized");
  //
  //   if (authenticated) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Authentication Successful!')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _supportState ? Text('supported') : Text('Not Supporter'),
        ),
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
                                            Column(
                                              children: [
                                                IconButton(
                                                  onPressed: _authenticate,
                                                  icon: const Icon(
                                                    Icons.face_sharp,
                                                    color: Colors.white,
                                                    size: 40,
                                                  ),
                                                ),
                                                const Text(
                                                  "Face ID",
                                                  style: TextStyle(
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 40),
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
                                  const SizedBox(height: 20),
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
                                          onPress: () {
                                            // Handle normal login
                                          },
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

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your censors to login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      print("Authenticated: $authenticated ");
      if (authenticated) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print('List of availableBiometrics: $availableBiometrics');
    if (!mounted) {
      return;
    }
  }
}
