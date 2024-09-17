import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/core/extensions.dart';
import 'package:submission_flutter_pemula/core/styles.dart';
import 'package:submission_flutter_pemula/core/widgets/custom_button.dart';
import 'package:submission_flutter_pemula/core/widgets/custom_text_form_field.dart';
import 'package:submission_flutter_pemula/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
                constraints: const BoxConstraints(maxWidth: 540),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    100.0.verticalSpace,
                    Text(
                      "Selamat datang!",
                      style: CustomTextStyle.titleTextStyle
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Silahkan login terlebih dahulu",
                      style: CustomTextStyle.subtitleTextStyle
                          .copyWith(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    40.0.verticalSpace,
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: _emailController,
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email tidak boleh kosong";
                              }
                              if (!value.contains("@")) {
                                return "Email tidak valid";
                              }
                              return null;
                            },
                            prefixIcon:
                                Icon(Icons.email, color: Colors.grey.shade700),
                          ),
                          24.0.verticalSpace,
                          CustomTextFormField(
                            obscureText: !isPasswordVisible,
                            label: "Password",
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password tidak boleh kosong";
                              }
                              if (value.length < 6) {
                                return "Password minimal 6 karakter";
                              }
                              return null;
                            },
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.grey.shade700),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              child: isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                        ],
                      ),
                    ),
                    40.0.verticalSpace,
                    CustomButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    24.0.verticalSpace,
                    const Text(
                      'atau',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    24.0.verticalSpace,
                    CustomButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google-logo.png',
                            height: 24,
                            width: 24,
                          ),
                          12.0.horizontalSpace,
                          const Text(
                            "Login with Google",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
