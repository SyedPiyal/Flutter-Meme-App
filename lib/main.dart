import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:listview/core/service/service_locator.dart';
import 'dart:convert';

import 'package:listview/core/view/home_view.dart';
import 'package:listview/core/provider/memes_provider.dart';
import 'package:provider/provider.dart';

import 'core/view/signup_view.dart';

void main() {
  // Initialized get_it
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MemesProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'API ListView Demo',
        home: SignupView(),
      ),
    );
  }
}
