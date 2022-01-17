import 'package:dokan/ApiCall/login_api.dart';
import 'package:dokan/InputField/input_field.dart';
import 'package:dokan/PageView/page_view.dart';
import 'package:dokan/RegistrationPage/registration_page.dart';
import 'package:dokan/Utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key, required this.image, required this.email})
      : super(key: key);
  final XFile? image;
  final String? email;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passlController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Image.asset("assets/images/Dukan.png"),
              SizedBox(
                height: height * 0.1,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 1.0),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: _emailController,
                          hint: "Email",
                          inputAction: TextInputAction.next,
                          prefixIcon: Icons.mail_outline_rounded,
                          obscured: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: _passlController,
                          hint: "Password",
                          prefixIcon: Icons.https_outlined,
                          inputAction: TextInputAction.done,
                          obscured: true,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            /*String statusCode = await LogInApi().logInDataPost(
                                _emailController.text.toString(),
                                _passlController.text.toString());
                                statusCode == '201'
                                */

                            if (formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Login Successful"),
                              ));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => VIewPage(
                                            image: image,
                                            email: email,
                                          )));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Login Not Successful"),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xffF75F55),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 138.0,
                                right: 138.0,
                                top: 15.0,
                                bottom: 15.0),
                            child: Text(
                              "LogIn",
                              style:
                                  TextStyle(fontSize: 15, letterSpacing: 1.5),
                            ),
                          ))
                    ],
                  )),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Image.asset("assets/images/facebook.png"),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Card(
                    elevation: 5,
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Image.asset("assets/images/google.png"),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const RegistrationPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Create New Account",
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
