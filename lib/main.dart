import 'package:flutter/material.dart';
import 'package:shadcn_port/components/accordion.dart';
import 'package:shadcn_port/components/button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Geist Variable"),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                CnButton(
                  onPressed: () {
                    print("something");
                  },
                  child: const Text("Click here"),
                ),
                CnButton(
                  buttonType: ButtonType.secondary,
                  onPressed: () {},
                  child: const Text("Click here"),
                ),
                CnButton(
                  buttonType: ButtonType.destructive,
                  onPressed: () {},
                  child: const Text("Click here"),
                ),
                CnButton(
                  buttonType: ButtonType.outline,
                  onPressed: () {},
                  child: const Text("Click here"),
                ),
                CnButton(
                  buttonType: ButtonType.ghost,
                  onPressed: () {},
                  child: const Text("Click here"),
                ),
                CnButton(
                  buttonType: ButtonType.link,
                  onPressed: () {},
                  child: const Text("Click here"),
                ),
                CnButton(
                  buttonType: ButtonType.icon,
                  onPressed: () {},
                  child: const Icon(Icons.send),
                ),
              ],
            )),
      ),
    );
  }
}
