import 'package:flutter/material.dart';
import 'package:listview/core/dataModel/auth_dataModel.dart';
import 'package:listview/core/view/home.dart';
import 'package:listview/core/provider/provider.dart';
import 'package:provider/provider.dart';

class RegView extends StatefulWidget {
  const RegView({super.key});

  @override
  State<RegView> createState() => _RegViewState();
}

class _RegViewState extends State<RegView> {
  final _emailController = TextEditingController(text: "eve.holt@reqres.in");
  final _passwordController = TextEditingController(text: "pistol");

  void signUp() async {
    RegistrationRequest registrationRequest = RegistrationRequest(
        email: _emailController.text, password: _passwordController.text);

    RegistrationResponse? regRes =
        await context.read<MemesProvider>().regUser(registrationRequest);
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
      print("//--------------> Error User data $e <--------------//");
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MemesProvider>(context);

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
