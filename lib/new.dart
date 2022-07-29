import 'package:flutter/material.dart';

class MyFormComponents extends StatefulWidget {
  const MyFormComponents({Key? key}) : super(key: key);

  @override
  State<MyFormComponents> createState() => _MyFormComponentsState();
}

class _MyFormComponentsState extends State<MyFormComponents> {
  String email = '';
  String emailError = '';
  String password = '';
  String passwordError = '';
  String message = '';    
  bool isLoading = false;
  bool isPassHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                onChanged: (value) => email = value,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    // label: Text("Email"),
                    hintText: 'Enter your email'),
              ),
            ),
            emailError.isEmpty
                ? const SizedBox()
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      emailError,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                obscureText: isPassHidden,
                onChanged: (value) => password = value,
                decoration: InputDecoration(
                    suffixIcon: isPassHidden
                        ? GestureDetector(
                            onTap: () => toggle(),
                            child: const Icon(Icons.visibility),
                          )
                        : GestureDetector(
                            onTap: () => toggle(),
                            child: const Icon(Icons.visibility_off),
                          ),
                    border: InputBorder.none,
                    hintText: 'Enter your password'),
              ),
            ),
            passwordError.isEmpty
                ? const SizedBox()
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      passwordError,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
            const SizedBox(height: 10),
            TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        setState(
                          () {
                            emailError = '';
                            passwordError = '';
                            message = '';
                            if (email.isEmpty) {
                              emailError = "Field cannot be empty";
                            }

                            if (password.isEmpty) {
                              passwordError = "Field cannot be empty";
                            }
                            if (email != '' && password != '') {
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email)) {
                                emailError = "Please enter valid email address";
                                return;
                              }
                              isLoading = true;
                              login();
                            }
                          },
                        );
                      },
                child: isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : const Text("Check Value")),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(message),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(
          () {
            message = "Login Success";
            isLoading = false;
          },
        );
      },
    );
  }

  toggle() {
    setState(
      () {
        isPassHidden = !isPassHidden;
      },
    );
  }
}
