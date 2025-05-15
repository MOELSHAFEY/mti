import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mti/presentation/sign_in.dart';

import '../logic/sign_up/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SuccessSignup) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Account created successfully"),
            ));
          } else if (state is ErrorSignup) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(18, 3, 17, 1),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 2),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70),
                    const Center(
                      child: Text("Create New Account ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 224, 224, 224),
                          )),
                    ),
                    const SizedBox(height: 40),
                    const Text("Email",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 224, 224, 224),
                        )),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        hintText: 'example@gmail.com',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 15),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(188, 224, 224, 224)),
                        fillColor: const Color.fromRGBO(242, 214, 241, 0.08),
                        filled: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text("Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 224, 224, 224),
                        )),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isPasswordVisible ? false : true,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        hintText: '**********',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 15),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(188, 224, 224, 224)),
                        fillColor: const Color.fromRGBO(242, 214, 241, 0.08),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 32),
                    InkWell(
                      onTap: () async {
                        await context.read<SignUpCubit>().submitForm(
                            _emailController.text, _passwordController.text);
                      },
                      canRequestFocus: false,
                      enableFeedback: false,
                      borderRadius: BorderRadius.circular(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 312,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        child: const Text('Sign up',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        },
                        child: const Text(
                          'have an account ? Sign in',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
