import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listview/core/dataModel/user.dart';
import 'package:listview/core/provider/auth_provider.dart';
import 'package:listview/core/view/home/home_view.dart';
import 'package:listview/core/provider/memes_provider.dart';
import 'package:listview/core/view/auth/login_view.dart';
import 'package:provider/provider.dart';

import '../../dataModel/registration_response.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "pistol");

  void signUp() async {
    User registrationRequest =
        User(email: _emailController.text, password: _passwordController.text);

    RegistrationResponse? regRes = await context
        .read<AuthProvider>()
        .userRegistration(registrationRequest);
    try {
      if (regRes != null && regRes.id != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Successfull"),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed"),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint("$e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MemesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 50,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  signUp();
                },
                child: provider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
