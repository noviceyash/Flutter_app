import 'package:flutter/material.dart';
import 'package:scapes_bouquet/pages/home_page.dart';
import 'package:scapes_bouquet/utils/routes.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 40.0,
            ),
            Image.asset(
              "assets/images/sign_up_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }

                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 8) {
                        return "Password should have at least 8 characters";
                      }

                      return null;
                    },
                  ),

                  SizedBox(
                    height: 50.0,
                  ),

                  Material(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(changeButton ? 70 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      //simple container
                      // child: Container(
                      //   width: 170,
                      //   height: 50,
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     "Sign Up",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18,
                      //     ),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: Colors.deepOrange,
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      // ),

                      //animated container
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 70 : 170,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                        // decoration: BoxDecoration(
                        //   color: Colors.deepOrange,
                        //   shape: changeButton? BoxShape.circle : BoxShape.rectangle,
                        //   // borderRadius: BorderRadius.circular(changeButton? 70 : 8),
                        // ),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   child: Text("Sign Up"),
                  //   style: TextButton.styleFrom(minimumSize: Size(170, 50)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
