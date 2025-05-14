import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mti/presentation/home_screen.dart';
import 'package:mti/presentation/signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  void _submitForm() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
      ),
    );
    setState(() {
      _isLoading = false;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Text("Hi, Welcome Back! ",
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                  focusedBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  hintText: '**********',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
                onTap: _isLoading ? null : _submitForm,
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
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 8, 83, 143)),
                          ),
                        )
                      : const Text('Login',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                ),
              ),
              const SizedBox(height: 13),
              InkWell(
                onTap: _isLoading ? null : _submitForm,
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
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 8, 83, 143)),
                          ),
                        )
                      : const Text('Login With Google',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                ),
              ),
              const SizedBox(height: 100),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don’t have an account ? Sign up',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
