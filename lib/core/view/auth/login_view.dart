import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listview/core/dataModel/login_response.dart';
import 'package:listview/core/dataModel/user.dart';
import 'package:listview/core/provider/auth_provider.dart';
import 'package:listview/core/view/home/home_view.dart';
import 'package:listview/core/provider/memes_provider.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "pistol");

  void login() async {
    User loginRequest = User(
      email: _emailController.text,
      password: _passwordController.text,
    );

    LoginResponse? loginResponse =
        await context.read<AuthProvider>().userLogin(loginRequest);
    try {
      if (loginResponse != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Successfull"),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
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
        title: const Text("Welcome"),
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
                  login();
                },
                child: provider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text(
                        "Login",
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
