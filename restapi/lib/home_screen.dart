import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/model/productModel.dart';
import 'package:restapi/signup.dart';

import 'examplefifthgetApi.dart';

class MYHomePage extends StatefulWidget {
  const MYHomePage({super.key});
  @override
  State<MYHomePage> createState() => _MYHomePageState();
}

class _MYHomePageState extends State<MYHomePage> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
}
