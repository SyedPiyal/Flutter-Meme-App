import 'package:flutter/material.dart';
import 'package:listview/core/auth_dataModel.dart';
import 'package:listview/core/home.dart';
import 'package:listview/core/provider.dart';
import 'package:provider/provider.dart';

class RegView extends StatefulWidget {
  const RegView({super.key});

  @override
  State<RegView> createState() => _RegViewState();
}

class _RegViewState extends State<RegView> {
  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController( text: "pistol");

  void signUp() async {
    RegistrationRequest registrationRequest = RegistrationRequest(
        email: _emailController.text, password: _passwordController.text);
    try {
      RegistrationResponse? registrationResponse =
          await context.read<MemsProvider>().signUp(registrationRequest);
      if (registrationResponse != null && registrationResponse.token != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Yoo Rasel vai")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Rasel vai Valo na"),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = Provider.of<MemsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("REq"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                child: regProvider.isLoading
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
