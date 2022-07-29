import 'package:flutter/material.dart';

class InputeUsingFrom extends StatefulWidget {
  const InputeUsingFrom({Key? key}) : super(key: key);

  @override
  State<InputeUsingFrom> createState() => _InputeUsingFromState();
}

class _InputeUsingFromState extends State<InputeUsingFrom> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.addListener(() {
      print(_emailController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'email'),
                validator: ((value) {
                  print(value);
                  if (value!.isEmpty) {
                    return 'filed cannot be empty';
                  }
                }),
              ),
              TextFormField(
                controller: _passController,
                decoration: const InputDecoration(hintText: 'password'),
                validator: ((value) {
                  print(value);
                  if (value!.isEmpty) {
                    return 'filed cannot be empty';
                  }
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text("login"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }
}
