import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/model/NewUserModel.dart';

class examplefifthgetApi extends StatefulWidget {
  const examplefifthgetApi({super.key});
  @override
  State<examplefifthgetApi> createState() => _examplefifthgetApiState();
}

class _examplefifthgetApiState extends State<examplefifthgetApi> {
  var data;
  Future<void> getApidata() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      throw Exception('No data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Expanded(
                child: FutureBuilder(
                    future: getApidata(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Text(data[index]['name'].toString());
                          });
                    }))));
  }
}

class Photos {
  String? title, url;
  Photos({required this.title, required this.url});
}
