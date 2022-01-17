import 'package:dokan/ApiCall/registration_api.dart';
import 'package:dokan/InputField/input_field.dart';
import 'package:dokan/LogInPage/login_page.dart';
import 'package:dokan/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  XFile? imagefile;
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  ImagePicker picker = ImagePicker();

  Future _imagePicker() async {
    var picture = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      imagefile = picture as XFile;
    });
  }

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
              Stack(children: [
                Card(
                  shape: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: IconButton(
                      onPressed: _imagePicker,
                      icon: const Icon(
                        Icons.person_outline_rounded,
                        size: 40.0,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 70,
                  top: 65,
                  child: Card(
                    shadowColor: Colors.black38,
                    shape: CircleBorder(),
                    color: Color(0xffF75F55),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ]),
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
                          controller: user,
                          hint: "Name",
                          inputAction: TextInputAction.next,
                          prefixIcon: Icons.person_outline_sharp,
                          obscured: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: email,
                          hint: "Email",
                          inputAction: TextInputAction.next,
                          prefixIcon: Icons.mail_outline_rounded,
                          obscured: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: pass,
                          hint: "Password",
                          prefixIcon: Icons.https_outlined,
                          inputAction: TextInputAction.next,
                          obscured: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: confirmPass,
                          hint: "Confirm Password",
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
                          onPressed: () async {
                            try {
                              if (pass.text.toString() ==
                                  confirmPass.text.toString()) {
                                String statusCode = await RegistrationApi()
                                    .dataPost(
                                        user.text.toString(),
                                        email.text.toString(),
                                        pass.text.toString());

                                if (formKey.currentState!.validate() &&
                                    statusCode == "201") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Registration Successful"),
                                  ));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => LogInPage(
                                                image: imagefile,
                                                email: email.text.toString(),
                                              )));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text("Registration Not Successful"),
                                  ));
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("password not match"),
                                ));
                              }
                            } catch (e) {
                              throw 'Something Wrong';
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
                              "Sign Up",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already Have An Account?",
                    style: TextStyle(letterSpacing: 0.5),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInPage(
                                    image: imagefile,
                                    email: email.text.toString(),
                                  )));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Color(0xff2893E3),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
