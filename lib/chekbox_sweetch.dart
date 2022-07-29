import 'package:flutter/material.dart';

class OtherWidget extends StatefulWidget {
  const OtherWidget({Key? key}) : super(key: key);

  @override
  State<OtherWidget> createState() => _OtherWidgetState();
}

class _OtherWidgetState extends State<OtherWidget> {
  bool isChecked = false;
  bool isChecked1 = false;

  List<String> checklist = ["A", "B", "C", "D", "E", "F"];
  List<String> selectChecklist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            activeColor: Colors.amber,
            value: isChecked1,
            onChanged: (v) {
              setState(
                () {
                  isChecked1 = v;
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: checklist.length,
              itemBuilder: (context, index) => CheckboxListTile(
                value: selectChecklist.contains(checklist[index]),
                title: Text(checklist[index]),
                onChanged: (v) {
                  if (selectChecklist.contains(checklist[index])) {
                    setState(
                      () {
                        selectChecklist.remove(checklist[index]);
                      },
                    );
                  } else {
                    setState(
                      () {
                        selectChecklist.add(checklist[index]);
                      },
                    );
                  }
                  print(selectChecklist);
                },
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (v) {
                  setState(
                    () {
                      isChecked = v!;
                    },
                  );
                },
              ),
              const Text("I accept t&c")
            ],
          ),
          isChecked
              ? const SizedBox()
              : const Text("Please accept t&c",
                  style: TextStyle(color: Colors.red)),
          ElevatedButton(
              onPressed: isChecked ? () {} : null, child: const Text("Submit"))
        ],
      ),
    );
  }
}
