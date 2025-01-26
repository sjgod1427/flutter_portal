import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/authentication.dart';
import 'package:flutter_portal/home.dart';
import 'package:flutter_portal/sign_up.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
    if (res == 'success') {
      setState(() {
        isLoading = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
      print(res);
    }
  }

  @override
  // Widget build(BuildContext context) {
  //   double screenHeight = MediaQuery.of(context).size.height;

  //   return Scaffold(
  //     backgroundColor: const Color.fromARGB(18, 19, 22, 30),
  //     body: Stack(
  //       children: [
  //         SafeArea(
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 children: [
  //                   SizedBox(height: screenHeight * 0.15),
  //                   const Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         'Bubble World',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                           color: Color(0xFFE2FF00),
  //                           fontSize: 65,
  //                           fontStyle: FontStyle.italic,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       Text(
  //                         'Thrill. Challenge. Victory !!',
  //                         style: TextStyle(
  //                           color: Color(0xFFE2FF00),
  //                           fontSize: 16,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 48),
  //                   _buildTextField(
  //                       hintText: 'Enter your Email',
  //                       icon: Icons.email_outlined,
  //                       controller: emailController),
  //                   const SizedBox(height: 16),
  //                   _buildTextField(
  //                       hintText: 'Enter your Password',
  //                       icon: Icons.lock_outline,
  //                       controller: passwordController,
  //                       obscureText: true),
  //                   Align(
  //                     alignment: Alignment.centerRight,
  //                     child: TextButton(
  //                       onPressed: () {
  //                         // Add forgot password functionality
  //                       },
  //                       child: const Text(
  //                         'Forgot password?',
  //                         style: TextStyle(
  //                           color: Colors.grey,
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 24),
  //                   SizedBox(
  //                     width: double.infinity,
  //                     child: ElevatedButton(
  //                       onPressed: loginUser,
  //                       style: ElevatedButton.styleFrom(
  //                         backgroundColor: const Color(0xFFE2FF00),
  //                         foregroundColor: Colors.black,
  //                         padding: const EdgeInsets.symmetric(vertical: 15),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(30),
  //                         ),
  //                       ),
  //                       child: const Text(
  //                         'Login',
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 16),
  //                   const Text(
  //                     'or',
  //                     style: TextStyle(
  //                       color: Colors.grey,
  //                       fontSize: 14,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 16),
  //                   SizedBox(
  //                     width: double.infinity,
  //                     child: OutlinedButton(
  //                       onPressed: () {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => Placeholder()),
  //                         );
  //                       },
  //                       style: OutlinedButton.styleFrom(
  //                         side: const BorderSide(color: Colors.grey),
  //                         padding: const EdgeInsets.symmetric(vertical: 15),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(30),
  //                         ),
  //                       ),
  //                       child: const Text(
  //                         'Sign up',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 16,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 10),
  //                   SignInButtonBuilder(
  //                     text: 'Sign in with Google',
  //                     textColor: Colors.black,

  //                     shape: StadiumBorder(),
  //                     icon: Icons.account_circle, iconColor: Colors.black,
  //                     backgroundColor: const Color.fromARGB(
  //                         255, 244, 244, 54), // Change the color
  //                     onPressed: () => AuthServices().signInWithGoogle(context),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(18, 19, 22, 30),
      body: Stack(
        children: [
          // First layer: GIF background
          SizedBox.expand(
            child: Image.asset(
              'assets/images/Final_background.gif', // Path to your GIF file
              fit: BoxFit.cover, // Ensures the GIF covers the entire screen
            ),
          ),
          // Second layer: SafeArea with login content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Bubble World',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFE2FF00),
                            fontSize: 65,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Thrill. Challenge. Victory !!',
                          style: TextStyle(
                            color: Color(0xFFE2FF00),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    _buildTextField(
                        hintText: 'Enter your Email',
                        icon: Icons.email_outlined,
                        controller: emailController),
                    const SizedBox(height: 16),
                    _buildTextField(
                        hintText: 'Enter your Password',
                        icon: Icons.lock_outline,
                        controller: passwordController,
                        obscureText: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add forgot password functionality
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: loginUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE2FF00),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'or',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SignInButtonBuilder(
                      text: 'Sign in with Google',
                      textColor: Colors.black,
                      shape: StadiumBorder(),
                      icon: Icons.account_circle,
                      iconColor: Colors.black,
                      backgroundColor: const Color.fromARGB(
                          255, 244, 244, 54), // Change the color
                      onPressed: () => AuthServices().signInWithGoogle(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required IconData icon,
      required TextEditingController controller,
      bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
