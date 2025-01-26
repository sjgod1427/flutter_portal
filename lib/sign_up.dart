// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_portal/authentication.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   bool isLoading = false;

//   void signUpUser() async {
//     final usersCollection = FirebaseFirestore.instance.collection('users');

//     final querySnapshot = await usersCollection
//         .where('username', isEqualTo: usernameController.text)
//         .get();

//     if (querySnapshot.docs.isNotEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Username already exists")));
//       return;
//     }

//     String res = await AuthServices().signUpUser(
//       email: emailController.text,
//       password: passwordController.text,
//       name: nameController.text,
//       username: usernameController.text,
//     );

//     if (res == 'Successfull') {
//       setState(() {
//         isLoading = true;
//       });
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const Placeholder()),
//       );
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     nameController.dispose();
//     usernameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(18, 19, 22, 30),
//       body: Stack(
//         children: [
//           // Background image with gradient
//           // Positioned(
//           //   top: 0,
//           //   left: 0,
//           //   right: 0,
//           //   height: screenHeight * 0.45,
//           //   child: ShaderMask(
//           //     shaderCallback: (Rect bounds) {
//           //       return LinearGradient(
//           //         begin: Alignment.topLeft,
//           //         end: Alignment.bottomRight,
//           //         colors: [
//           //           Colors.black.withOpacity(0.7),
//           //           Colors.transparent,
//           //         ],
//           //       ).createShader(bounds);
//           //     },
//           //     blendMode: BlendMode.dstIn,
//           //     child: Image.asset(
//           //       'images/slotMachine.png',
//           //       fit: BoxFit.cover,
//           //       opacity: const AlwaysStoppedAnimation(0.5),
//           //     ),
//           //   ),
//           // ),

//           // Main content
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 20, left: 24, right: 24, bottom: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: screenHeight * 0.15),
//                     // Logo and tagline
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Howzie',
//                           style: TextStyle(
//                             color: Color(0xFFE2FF00),
//                             fontSize: 65,
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Create. Explore. Achieve !! ',
//                           style: TextStyle(
//                             color: Color(0xFFE2FF00),
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 48),

//                     // Name field
//                     _buildTextField(
//                       controller: nameController,
//                       hintText: 'Enter your Name',
//                       icon: Icons.person,
//                     ),
//                     const SizedBox(height: 16),

//                     // Username field
//                     _buildTextField(
//                       controller: usernameController,
//                       hintText: 'Enter your Username',
//                       icon: Icons.person_outline,
//                     ),
//                     const SizedBox(height: 16),

//                     // Email field
//                     _buildTextField(
//                       controller: emailController,
//                       hintText: 'Enter your Email',
//                       icon: Icons.email_outlined,
//                     ),
//                     const SizedBox(height: 16),

//                     // Password field
//                     _buildTextField(
//                       controller: passwordController,
//                       hintText: 'Enter your Password',
//                       icon: Icons.lock_outline,
//                       obscureText: true,
//                     ),
//                     const SizedBox(height: 24),

//                     // Sign Up button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: signUpUser,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFFE2FF00),
//                           foregroundColor: Colors.black,
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: isLoading
//                             ? const CircularProgressIndicator(
//                                 color: Colors.black)
//                             : const Text(
//                                 'Sign Up',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                       ),
//                     ),

//                     const SizedBox(height: 16),
//                     const Text(
//                       'Already Have an Account?',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: OutlinedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Placeholder()),
//                           );
//                         },
//                         style: OutlinedButton.styleFrom(
//                           side: const BorderSide(color: Colors.grey),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required IconData icon,
//     bool obscureText = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[800],
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         style: const TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Colors.grey),
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           border: InputBorder.none,
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/authentication.dart';
import 'package:flutter_portal/home.dart';
import 'package:flutter_portal/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');

    final querySnapshot = await usersCollection
        .where('username', isEqualTo: usernameController.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Username already exists")));
      return;
    }

    String res = await AuthServices().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      username: usernameController.text,
    );

    if (res == 'Successfull') {
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
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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

          // Second layer: Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 24, right: 24, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    // Logo and tagline
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
                          'Create. Explore. Achieve !! ',
                          style: TextStyle(
                            color: Color(0xFFE2FF00),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 48),

                    // Name field
                    _buildTextField(
                      controller: nameController,
                      hintText: 'Enter your Name',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),

                    // Username field
                    _buildTextField(
                      controller: usernameController,
                      hintText: 'Enter your Username',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 16),

                    // Email field
                    _buildTextField(
                      controller: emailController,
                      hintText: 'Enter your Email',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),

                    // Password field
                    _buildTextField(
                      controller: passwordController,
                      hintText: 'Enter your Password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),

                    // Sign Up button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: signUpUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE2FF00),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black)
                            : const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      'Already Have an Account?',
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
                                builder: (context) => LoginScreen()),
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
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
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
