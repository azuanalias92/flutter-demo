import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jomtender/home_screen.dart';
import 'package:jomtender/profile_page/class/user.dart';
import '../../app_theme.dart';
import 'package:http/http.dart' as http;

class UpdateProfileView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final User? data;

  const UpdateProfileView(
      {Key? key, this.animationController, this.animation, this.data})
      : super(key: key);

  Future<void> logout(context) async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'token');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  Future<void> editUser(context, data, name, email, password) async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if (token?.isEmpty ?? true) {
      throw Exception('Failed to load token');
    } else {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      const api = String.fromEnvironment('API_URL');
      print(data!.id);

      final response = await http.patch(
        Uri.parse('$api/users/${data!.id}'),
        headers: headers,
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load user');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    nameController.text = data!.name;
    final emailController = TextEditingController();
    emailController.text = data!.email;
    final phoneController = TextEditingController();
    phoneController.text = data!.phone ?? '';
    final passwordController = TextEditingController();

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
                                  child: Image.asset("./assets/all.png")),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppTheme.white),
                                child: const Icon(Icons.edit,
                                    color: Colors.black, size: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                              child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('Nama Penuh'),
                                    prefixIcon: Icon(Icons.person)),
                                controller: nameController,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('Emel'),
                                    prefixIcon: Icon(Icons.email)),
                                controller: emailController,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('No Telefon'),
                                    prefixIcon: Icon(Icons.phone)),
                                controller: phoneController,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  label: const Text('Kata Laluan'),
                                  prefixIcon: const Icon(Icons.fingerprint),
                                  suffixIcon: IconButton(
                                      icon: const Icon(Icons.visibility_off),
                                      onPressed: () {}),
                                ),
                                controller: passwordController,
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    editUser(
                                        context,
                                        data,
                                        nameController.text,
                                        emailController.text,
                                        passwordController.text)
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.white,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: const Text('Sunting Profil',
                                      style:
                                          TextStyle(color: AppTheme.darkGrey)),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => {logout(context)},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.palleteRed,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: const Text('Log Keluar',
                                      style:
                                          TextStyle(color: AppTheme.darkGrey)),
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
