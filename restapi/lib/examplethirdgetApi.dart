import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/model/NewUserModel.dart';

class examplethirdgetApi extends StatefulWidget {
  const examplethirdgetApi({super.key});
  @override
  State<examplethirdgetApi> createState() => _examplethirdgetApiState();
}

class _examplethirdgetApiState extends State<examplethirdgetApi> {
  List<PostsModal> listuser = [];
  Future<List<PostsModal>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        listuser.add(PostsModal.fromJson(i));
      }
      return listuser;
    } else {
      throw Exception('No Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: listuser.length,
                        itemBuilder: (context, index) {
                          return (Card(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    snapshot.data![index].email.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(snapshot.data![index].address.city
                                    .toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(snapshot
                                    .data![index].address.geo.lat
                                    .toString()),
                              )
                            ]),
                          ));
                        });
                  }))),
    );
  }
}

class Photos {
  String? title, url;
  Photos({required this.title, required this.url});
}
