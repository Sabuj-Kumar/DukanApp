import 'package:dokan/InputField/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonAccount extends StatefulWidget {
  const PersonAccount({Key? key, required this.image, required this.email})
      : super(key: key);
  final XFile? image;
  final String? email;
  @override
  _PersonAccountState createState() => _PersonAccountState();
}

class _PersonAccountState extends State<PersonAccount> {
  XFile? _images;
  @override
  void initState() {
    _images = widget.image as XFile?;
    super.initState();
  }

  String? firstname = "Smith";
  String? lastname = "Jon";
  bool flag = false;
  firstName(String s) {
    setState(() {
      firstname = s;
    });
  }

  lastName(String s) {
    setState(() {
      lastname = s;
    });
  }

  TextEditingController fstname = TextEditingController();
  TextEditingController lstname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F8F8),
        title: const Text(
          "My Account",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        elevation: 0.0,
        centerTitle: true,
        titleSpacing: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Card(
                shape: CircleBorder(),
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "$firstname $lastname",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text("$widget.email"),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person),
                SizedBox(
                  width: width - (width * 0.3),
                  child: ExpansionTile(
                    title: const Text("Account"),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: fstname,
                          hint: "Firstname",
                          prefixIcon: Icons.person,
                          inputAction: TextInputAction.done,
                          obscured: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(
                          controller: lstname,
                          hint: "Lastname",
                          prefixIcon: Icons.person,
                          inputAction: TextInputAction.done,
                          obscured: false,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 12, top: 12, bottom: 12),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white70,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              onPressed: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 12.0, top: 12, bottom: 12, right: 12),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              onPressed: () {
                                firstName(fstname.text.toString());
                                lastName(lstname.text.toString());
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0, top: 12, bottom: 12, right: 16),
                                child: Text(
                                  "Save",
                                  style: TextStyle(letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock),
                SizedBox(
                  width: width - (width * 0.3),
                  child: const ExpansionTile(
                    title: Text("Password"),
                    children: [],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.notifications_none_outlined),
                SizedBox(
                  width: width - (width * 0.3),
                  child: const ExpansionTile(
                    title: Text("Notification."),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite_border),
                SizedBox(
                  width: width - (width * 0.3),
                  child: const ExpansionTile(
                    title: Text("Notification."),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
