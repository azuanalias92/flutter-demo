import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:jomtender/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../app_theme.dart';

class LoginView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const LoginView({Key? key, this.animationController, this.animation})
      : super(key: key);

  Future<void> postLogin(context, email, password) async {
    const api = String.fromEnvironment('API_URL');
    final response = await http.post(
      Uri.parse('$api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'traone@duck.com', //email
        'password': 'abcd1234', //password
      }),
    );

    Map<String, dynamic> jsonResponse = json.decode(response.body);

    //developer.log(response.body, name: 'jomtender');
    //print(jsonResponse['accessToken']);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: jsonResponse['accessToken']);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //throw Exception('Failed to load user');
      Fluttertoast.showToast(
          msg: "Login Failed",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.redAccent,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();

    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation!.value), 0.0),
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset("./assets/24-hours.png")),
                            )
                          ],
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                              child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                controller: emailEditingController,
                                decoration: const InputDecoration(
                                    label: Text('Emel'),
                                    prefixIcon: Icon(Icons.person)),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                controller: passwordEditingController,
                                decoration: InputDecoration(
                                  label: const Text('Kata Laluan'),
                                  prefixIcon: const Icon(Icons.fingerprint),
                                  suffixIcon: IconButton(
                                      icon: const Icon(Icons.visibility_off),
                                      onPressed: () {}),
                                ),
                              ),
                              SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    postLogin(
                                        context,
                                        emailEditingController.text,
                                        passwordEditingController.text)
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.white,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: Text(
                                    'Log Masuk',
                                    style: TextStyle(
                                        color: AppTheme.darkGrey,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        )
                      ],
                    )),
              )),
        );
      },
    );
  }
}
