import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivewithboxadapter/model/EmployeeModel.dart';
import 'package:hivewithboxadapter/view/home_screen/HomeScreen.dart';

import 'AppSessions.dart';

Future<void> main()
async {
  // Employee employee1 = Employee(name: "Amr", designation: "Developer");
  // int a = 10;
  // String name = "Amrutha";
  await Hive.initFlutter(); // Initialization
  var box = await Hive.openBox(AppSessions.EmployeeBOX);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive with Box Adapter Demo',
      home: HomeScreen(),
    );
  }
}

