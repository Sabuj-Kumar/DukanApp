import 'package:dokan/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Menu Bar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.5,
            ),
            const Text("Item One."),
            const Text("Item One."),
            const Text("Item One."),
            const Text("Item One."),
          ],
        ),
      ),
    );
  }
}
