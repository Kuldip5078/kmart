import 'package:flutter/material.dart';

class RedioButton extends StatefulWidget {
  const RedioButton({Key? key}) : super(key: key);

  @override
  State<RedioButton> createState() => _RedioButtonState();
}

class _RedioButtonState extends State<RedioButton> {
  int _value = 1;
  // int value=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Redio button"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                    // _value=value;
                    });
                  }),
              const SizedBox(
                width: 10,
              ),
              const Text("radio 1")
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      // _value = value;
                    });
                  }),
              const SizedBox(
                width: 10,
              ),
              const Text("radio 2")
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      // _value = value;
                    });
                  }),
              const SizedBox(
                width: 10,
              ),
              const Text("radio 3")
            ],
          ),
        ],
      ),
    );
  }
}
