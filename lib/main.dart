import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:listview/core/home.dart';
import 'package:listview/core/provider.dart';
import 'package:provider/provider.dart';

import 'core/reg_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MemsProvider>(
          create: (context) => MemsProviderImpl(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'API ListView Demo',
        home: RegView(),
      ),
    );
  }
}
