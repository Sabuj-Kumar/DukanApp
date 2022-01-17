import 'package:dokan/Utils/constants.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.5,
              ),
              const Text("Shopping "),
              const Text("Shopping "),
              const Text("Shopping "),
              const Text("Shopping "),
              const Text("Shopping "),
            ],
          ),
        ),
      ),
    );
  }
}
