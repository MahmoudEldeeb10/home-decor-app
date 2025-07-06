import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_decor/src/features/widgets/custom_textformfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: TextStyle(
            color: Color(0xFFF4B5A4),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Please enter your details to proceed.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40),
              CustomTextformfield(
                upperlabel: "Username Or Email",
                controller: _emailController,
                hintText: 'Enter username or email',
              ),
              SizedBox(height: 24),
              CustomTextformfield(
                upperlabel: "Password",
                controller: _passwordController,
                hintText: '●●●●●●●●',
                isPassword: true,
              ),
              SizedBox(height: 32),
              Center(
                child: Container(
                  width: 186,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE8A898),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Forgot Password
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:home_decor/bloc/auth_cubit.dart';
// import 'package:home_decor/src/features/screens/forgot_password_screen.dart';
// import 'package:home_decor/src/features/widgets/custom_button.dart';
// import 'package:home_decor/src/features/widgets/custom_textformfield.dart';
// import 'package:home_decor/src/features/screens/signup_screen.dart';

// import 'package:home_decor/bloc/auth_cubit.dart';
// import 'package:home_decor/bloc/auth_state.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   // Define colors locally for this screen
//   static const Color _primaryPeach = Color(0xFFED8F70);
//   static const Color _white = Colors.white;
//   static const Color _black = Colors.black;
//   static const Color _grey = Colors.grey;
//   static const Color _darkGrey = Color(0xFF3F3F3F);

//   // Define text styles locally for this screen
//   static const TextStyle _welcomeTextStyle = TextStyle(
//     fontSize: 28,
//     fontWeight: FontWeight.bold,
//     color: _black,
//   );

//   static const TextStyle _bodyTextStyle = TextStyle(
//     fontSize: 16,
//     color: _darkGrey,
//   );

//   static const TextStyle _linkTextStyle = TextStyle(
//     fontSize: 14,
//     color: _primaryPeach,
//     fontWeight: FontWeight.w600,
//   );

//   static const TextStyle _socialLoginTextStyle = TextStyle(
//     fontSize: 14,
//     color: _darkGrey,
//     fontWeight: FontWeight.w500,
//   );

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenHeight = mediaQuery.size.height;
//     final screenWidth = mediaQuery.size.width;

//     return Scaffold(
//       backgroundColor: _white,
//       body: BlocListener<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is AuthLoading) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Logging in...')),
//             );
//           } else if (state is AuthSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//             // Navigate to home screen or dashboard
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.error)),
//             );
//           }
//         },
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: screenHeight * 0.15),
//                   const Text(
//                     'Welcome',
//                     style: _welcomeTextStyle,
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   const Text(
//                     'Please enter your details to proceed.',
//                     style: _bodyTextStyle,
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Username Or Email',
//                       style: _bodyTextStyle.copyWith(
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   CustomTextFormField(
//                     controller: _emailController,
//                     hintText: 'example@example.com',
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Password',
//                       style: _bodyTextStyle.copyWith(
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   BlocBuilder<AuthCubit, AuthState>(
//                     buildWhen: (previous, current) =>
//                         current is PasswordVisibilityToggled,
//                     builder: (context, state) {
//                       final isObscure = context
//                           .read<AuthCubit>()
//                           .isPasswordVisible;
//                       return CustomTextFormField(
//                         controller: _passwordController,
//                         hintText: '********',
//                         obscureText: !isObscure,
//                         keyboardType: TextInputType.text,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             isObscure ? Icons.visibility : Icons.visibility_off,
//                             color: _grey,
//                           ),
//                           onPressed: () {
//                             context
//                                 .read<AuthCubit>()
//                                 .togglePasswordVisibility();
//                           },
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           return null;
//                         },
//                       );
//                     },
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   CustomButton(
//                     text: 'Log In',
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         context.read<AuthCubit>().login(
//                           _emailController.text,
//                           _passwordController.text,
//                         );
//                       }
//                     },
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const ForgotPasswordScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Forgot Password?',
//                         style: _linkTextStyle,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   const Text(
//                     'or sign up with',
//                     style: _socialLoginTextStyle,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: _grey.withOpacity(0.5)),
//                         ),
//                         padding: const EdgeInsets.all(12),
//                         child: Icon(
//                           Icons.apple,
//                           size: 30,
//                           color: _darkGrey.withOpacity(0.8),
//                         ),
//                       ),
//                       SizedBox(width: screenWidth * 0.05),
//                       Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: _grey.withOpacity(0.5)),
//                         ),
//                         padding: const EdgeInsets.all(12),
//                         child: Icon(
//                           Icons.mail,
//                           size: 30,
//                           color: _darkGrey.withOpacity(0.8),
//                         ), // Google icon placeholder
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Don't have an account?",
//                         style: _socialLoginTextStyle,
//                       ),
//                       SizedBox(width: screenWidth * 0.01),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const SignUpScreen(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: _linkTextStyle,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
